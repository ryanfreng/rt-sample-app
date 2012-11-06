include ApplicationHelper

def valid_signin(user)
  fill_in "Email",     with: user.email
  fill_in "Password",  with: user.password
  click_button "Sign in"
end

def fill_in_form_with_good_data
  attrs = FactoryGirl.attributes_for(:user)
  fill_in "Name",           with: attrs[:name]
  fill_in "Email",          with: attrs[:email]
  fill_in "Password",       with: attrs[:password]
  fill_in "Confirmation",   with: attrs[:password]
end

SELECTOR_MATCHES = { have_error_message:    'div.alert.alert-error',
                     have_success_message:  'div.alert.alert-success',
                     have_header:           'h1',
                     have_title:            'title' }

SELECTOR_MATCHES.each do |key, value|
  RSpec::Matchers.define key do |message|
    match do |page|
      page.should have_selector(value, text: message)
    end
  end
end

# RSpec::Matchers.define :have_error_message do |message|
#   match do |page|
#     page.should have_selector('div.alert.alert-error', text: message)
#   end
# end

# RSpec::Matchers.define :have_success_message do |message|
#   match do |page|
#     page.should have_selector('div.alert.alert-success', text: message)
#   end
# end

# RSpec::Matchers.define :have_header do |message|
#   match do |page|
#     page.should have_selector('h1', text: message) }
#   end
# end

# RSpec::Matchers.define :have_title do |message|
#   match do |page|
#     page.should have_selector('title',  text: message) }
#   end
# end