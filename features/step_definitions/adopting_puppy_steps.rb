#require "features/support/pages/details_page"
#include PageObject

Given /^I am on the puppy adopting site$/ do
  #visit_page(HomePage)
  @browser.goto "http://puppies.herokuapp.com"
  @home = HomePage.new(@browser)
end

When /^I click the View Details button for "([^"]*)"$/ do |name|
  on_page(HomePage).select_puppy name
end
When /^I click the Adopt Me button$/ do
  @browser.button(:value => 'Adopt Me!').click
  #@details.add_to_cart
  @cart = ShoppingCartPage.new(@browser)
end

When /^I click the Complete the Adoption button$/ do
  on_page(ShoppingCartPage).proceed_to_checkout
  ##@browser.button(:value => 'Complete the Adoption').click
  #@cart.proceed_to_checkout
  #@checkout = CheckoutPage.new(@browser)
end
When /^I click the Adopt Another Puppy button$/ do
  on_page(ShoppingCartPage).continue_adopting
  ##@browser.button(:value => 'Adopt Another Puppy').click
  #@cart.continue_adopting
end


#Fill the fields
When /^I enter "([^"]*)" in the name field$/ do |name|
  #@browser.text_field(:id => 'order_name').set(name)
  @checkout.name = name
end
When /^I enter "(.+)" in the address field$/ do |address|
  #@browser.text_field(:id => 'order_address').set(address)
  @checkout.address=address
end
When /^I enter "([^"]*)" in the email field$/ do |email|
  #@browser.text_field(:id => 'order_email').set(email)
  @checkout.email=email
end

When /^I select "([^"]*)" from the pay with dropdown$/ do |pay_type|
  #@browser.select_list(:id => 'order_pay_type').select(pay_type)
  @checkout.pay_type=pay_type
end
When /^I click the Place Order button$/ do
  #@browser.button(:value => 'Place Order').click
  @checkout.place_order
end


#what should I see
Then /^I should see "([^"]*)"$"/ do |expected|
  @browser.text.should include expected
end

#Button clicking
When /^I click the first View Details button$/ do
  @browser.button(:value => 'View Details', :index => 0).click
end


When /^I click the View Details button$/ do
  on_page(HomePage).select_puppy name
  @home.select_puppy_number 1
  #@browser.button(:value => "View Details").click
  @details = DetailsPage.new(@browser)
end

When /^I click the second View Details button$/ do
  @home.select_puppy_number 2
  #@browser.button(:value => 'View Details', :index => 1).click
  @details = DetailsPage.new(@browser)
end

#def row_for(line_item)
#  (line_item - 1) * 6
#end
#
#def cart_line_item(line_item)
#  @browser.table(:index =>0)[row_for(line_item)]
#end

Then /^I should see "([^"]*)" as the name for line item (\d+)$/ do |name, line_item|
  #cart_line_item(line_item.to_i)[1].text.should include name
  @cart.name_for_line_item(line_item.to_i).should include name
end

When /^I should see "([^"]*)" as the subtotal for line item (\d+)$/ do |subtotal, line_item|
  #cart_line_item(line_item.to_i)[3].text.should ==subtotal
  @cart.subtotal_for_line_item(line_item.to_i).should ==subtotal
end
When /^I should see "([^"]*)" as the cart total$/ do |total|
  #@browser.td(:class => 'total_cell').text.should == total
  @cart.cart_total.should ==total
end
When /^I complete the adoption with$/ do |table|
  # table is a
  #| Cheezy | 123 Main street | cheezy@example.com | Check |
    on_page(CheckoutPage).checkout(table.hashes.first)
end
When /^I complete the adoption of a puppy "([^"]*)"$/ do |name|
  on_page(HomePage).select_puppy(name)
  on_page(DetailsPage).add_to_cart
  on_page(ShoppingCartPage).proceed_to_checkout
  on_page(CheckoutPage).checkout

end
When /^I complete the adoption using credit card$/ do
  on_page(CheckoutPage).checkout('pay_type' => 'Credit card')
end
When /^I complete the adoption using Credit card$/ do
  on_page(CheckoutPage).checkout('pay_type' => 'Credit card')
end
When /^I complete the adoption$/ do
  on_page(CheckoutPage).checkout
end
