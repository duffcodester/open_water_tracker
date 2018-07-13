require 'spec_helper'

describe 'Navbar' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }

  subject { page }

  describe 'should have the correct links' do

    describe 'as admin' do
      before do
        Warden.test_reset!
        login_as(admin, scope: :user)
        visit root_path
      end

      it { should have_link('Check In', swimmers_path) }
      it { should have_link('Check Out', swim_records_path) }
      it { should have_link('Monitors', users_path) }
      it { should have_link('Analytics', analytics_path) }
      it { should have_link('Account') }
      it { should have_link('My Profile', user_path(admin)) }
      it { should have_link('Logout', destroy_user_session_path) }
    end

    describe 'as non-admin' do
      before do
        Warden.test_reset!
        login_as(user, scope: :user)
        visit root_path
      end

      it { should have_link('Check In', swimmers_path) }
      it { should have_link('Check Out', swim_records_path) }
      it { should_not have_link('Users', users_path) }
      it { should_not have_link('Analytics', analytics_path) }
      it { should have_link('Account') }
      it { should have_link('My Profile', user_path(admin)) }
      it { should have_link('Logout', destroy_user_session_path) }
    end
  end
end
