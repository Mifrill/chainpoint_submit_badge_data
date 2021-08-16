Feature: Submit badge
  I as User can submit badge data to the Chainpoint network

  Scenario: User can submit badge data to the Chainpoint network
    Given Recipient
    And fake-uuid
    When User visit the submit page
    And he able to enter badge data
    And he fill issue date
    And he click on submit button
    Then he see information about the response from the network
