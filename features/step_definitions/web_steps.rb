Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, :with => value)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I click the "([^"]*)" link$/) do |link_text|
  click_link(link_text)
end

Then(/^I am redirected to the "([^"]*)" page$/) do |arg1|
  visit '/next'
end