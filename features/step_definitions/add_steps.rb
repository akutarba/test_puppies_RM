
Then /^I should see '(.*)'$/ do |text|
  @browser.text.should include text
end
