require 'spec_helper'

describe 'Out of State' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:swimmer) { FactoryGirl.create(:swimmer) }

  before do
    Warden.test_reset!
    login_as(user, scope: :user)
    visit out_of_state_swimmers_path
  end

  subject { page }

  it { should have_title('COMSA Tracker | Out of State Swimmers') }

  describe 'on mobile view' do
    it { should have_content('Last Name') }
    it { should have_content('First Name') }
    it { should have_content('MI') }
    it { should have_content('USMS Number') }
    it { should have_content('LMSC') }
    it { should have_content('Check In') }
    it { should have_selector('h4', text: 'Out of State Swimmers') }
  end

  describe 'on desktop view' do
    it { should_not have_content('Phone Number') }
    it { should have_content('Full Name') }
    it { should have_selector('h1', text: 'Out of State Swimmers') }
  end

  describe 'should display out of state swimmers' do
    # tests for angular tags in ng-repeat
    it { should have_content('swimmer.first_name') }
    it { should have_content('swimmer.last_name') }
    it { should have_content('swimmer.middle_initial') }
    it { should have_content('swimmer.usms_number') }
    it { should have_content('swimmer.lmsc') }
  end
end