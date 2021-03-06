Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Background:
    Given I am on the puppy adopting site
#  Scenario: Adopting one puppy
#    #Given I am on the puppy adopting site
#    When I click the View Details button
#    And I click the Adopt Me button
#    And  I click the Complete the Adoption button
#    And I enter "Cheezy" in the name field
#    And I enter "123 Main street" in the address field
#    And I enter "cheezy@example.com" in the email field
#    And I select "Credit card" from the pay with dropdown
#    And I click the Place Order button
#    Then I should see "Thank you for adopting a puppy!"
#
#
#  Scenario Outline: Adopting two puppy
#    #Given I am on the puppy adopting site
#    When I click the first View Details button
#    And I click the Adopt Me button
#    And I click the Adopt Another Puppy button
#    And I click the second View Details button
#    And I click the Adopt Me button
#    And I click the Complete the Adoption button
#    And I enter "<name>" in the name field
#    And I enter "<address>" in the address field
#    And I enter "<email>" in the email field
#    And I select "<pay_type>" from the pay with dropdown
#    And I click the Place Order button
#    Then I should see "Thank you for adopting a puppy!"
#  Examples:
#    | name   | address         | email              | pay_type       |
#    | Cheezy | 123 Main street | cheezy@example.com | Credit card    |
#    | Joseph | 555 South       | joe@guru.com       | Check          |
#    | Jared  | 234 leandog     | doc@dev.com        | Purchase order |


#  Scenario: Validate cart with one puppy
#    When I click the View Details button for "Brook"
#    And I click the Adopt Me button
#    Then I should see "Brook" as the name for line item 1
#    And I should see "$34.95" as the subtotal for line item 1
#    And I should see "$34.95" as the cart total
#
#  Scenario: Validate cart with two puppies
#    When I click the first View Details button
#    And I click the Adopt Me button
#    And I click the Adopt Another Puppy button
#    And I click the second View Details button
#    And I click the Adopt Me button
#    Then I should see "Brook" as the name for line item 1
#    And I should see "$34.95" as the subtotal for line item 1
#    And I should see "Hanna" as the name for line item 2
#    And I should see "$22.99" as the subtotal for line item 2
#    And I should see "$57.94" as the cart total
#
#  Scenario: Adopting  PUPPY USING A TABLE
#    When  I click the View Details button for "Brook"
#    And I click the Adopt Me button
#    And I click the Complete the Adoption button
#    And I complete the adoption with
#      | name   | address         | email              | pay_type |
#      | Cheezy | 123 Main street | cheezy@example.com | Check    |
#    Then I should see "Thank you for adopting a puppy!"

   Scenario: Thank you message should be displayed
     When I complete the adoption of a puppy "Brook"
     Then I should see "Thank you for adopting a puppy!"

    Scenario: Adopting a puppy using partial default data
      When I click the View Details button for "Brook"
      And I click the Adopt Me button
      And I click the Complete the Adoption button
      And I complete the adoption using Credit card
      Then I should see 'Thank you for adopting a puppy'
     Scenario: Adopting a puppy using all default data
       When I click the View Details button for "Brook"
       And I click the Adopt Me button
       And I click the Complete the Adoption button
       And I complete the adoption
       Then I should see 'Thank you for adopting a puppy'

#     Scenario: Name is a required field
#       When I navigate to the checkout page
#       And I complete the form leaving the name field blank "-1"
#       Then I should see the error message "Name can't be blank"