FactoryBot.define do
  factory :badge do
    recipient
    uuid { Faker::Internet.uuid }
    proof_id { Faker::IDNumber.valid }
    issue_date { Date.current.iso8601 }
  end
end
