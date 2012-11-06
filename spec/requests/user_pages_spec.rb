require 'spec_helper'

describe  "User pages" do
  
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_header('Sign up') }
    it { should have_title('Sign up')}
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_header(user.name) }
    it { should have_title(user.name) }    
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up')}
        it { should have_error_message('error') }
        it { should_not have_content('digest')}
      end

    end

    describe "with valid information" do
      before { fill_in_form_with_good_data }

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end  

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email(FactoryGirl.attributes_for(:user)[:email]) }

        it { should have_title(user.name) }
        it { should have_success_message('Welcome')}
        it { should have_link('Sign out') }
      end    

    end

  end

end