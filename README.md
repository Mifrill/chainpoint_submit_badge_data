# README

- Present a means to enter badge data.
- Take the data submitted and create a hash to submit to the network.
- Submit this hash to the Chainpoint network.
- Display information about the response from the network.

```
bundle install

bundle exec rails db:setup

bundle exec rails s

visit http://localhost:3000/submit

bundle exec rails cucumber

bundle exec rspec

bundle exec rubocop
```

TODO:

- apply graceful validations error handle
- implement logic for 'Retrieve a partial Chainpoint Proof'
- implement logic for 'Retrieve a full Chainpoint Proof'
- implement logic for 'Verify a Chainpoint Proof'
- wrap logic in BadgeController#create into CRUD service

Notes:
- https://medium.com/tierion/how-to-create-and-verify-a-chainpoint-proof-eba52a7700e3
- https://github.com/chainpoint/chainpoint-gateway
- https://github.com/heartcombo/simple_form/wiki/Nested-Models
- https://github.com/chainpoint/chainpoint-gateway/wiki/Gateway-HTTP-API
