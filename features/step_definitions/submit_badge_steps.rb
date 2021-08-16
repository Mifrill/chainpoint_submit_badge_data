Given(/\ARecipient\z/) do
  FactoryBot.create(:recipient, name: 'John')
end

And(/\Afake-uuid\z/) do
  uuid = instance_double(Services::Uuid)
  expect(Services::Uuid).to receive(:new).and_return(uuid)
  expect(uuid).to receive(:call).and_return('test-uuid')
end

When(/\AUser visit the submit page\z/) do
  visit('/submit')
end

And(/\Ahe able to enter badge data\z/) do
  expect(page).to have_current_path('/submit')
  expect(page).to have_css('input#badge_issue_date')
  expect(find_field(id: 'badge_issue_date').value).to be_nil
  expect(page).to have_css('input#badge_recipient_attributes_name')
  expect(find_field(id: 'badge_recipient_attributes_name').value).to eq('John')
  expect(page).to have_css('input#badge_uuid')
  expect(find_field(id: 'badge_uuid').value).not_to be_nil
end

And(/\Ahe fill issue date\z/) do
  find(:xpath, "//input[@id='badge_issue_date']").set('2021-08-16')
  expect(find_field(id: 'badge_issue_date').value).to eq('2021-08-16')
end

And(/\Ahe click on submit button\z/) do
  hash_generator = instance_double(Services::Chainpoint::HashGenerator)
  mocked_hash = 'TEST_HASH'
  expect(Services::Chainpoint::HashGenerator)
    .to receive(:new).with(values: %w[2021-08-16 John test-uuid]).and_return(hash_generator)
  expect(hash_generator).to receive(:generate).with(no_args).and_return(mocked_hash)
  VCR.use_cassette('chainpoint_network_submit') do
    expect { page.find("input[@value='Create Badge']").click }
      .to change { Badge.count }.from(0).to(1)
  end
  expect(page).to have_current_path('/success')
end

Then(/\Ahe see information about the response from the network/) do
  expect(page).to have_content('Badge Submitted!')
  expect(page).to have_content("Badge UUID: #{Badge.first.uuid}")
  expect(page).to have_content("Hash: #{Badge.first.sha_256}")
  expect(page).to have_content("Hash ID Node: #{Badge.first.proof_id}")
end
