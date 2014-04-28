require 'spec_helper'

describe 'Check In' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:swimmer) { FactoryGirl.create(:swimmer) }

  before do
    Warden.test_reset!
    login_as(user, scope: :user)
    visit swimmers_path
  end

  subject { page }

  it { should have_title(full_title('Check In')) }

  describe 'on mobile view' do
    it { should have_content('Last Name') }
    it { should have_content('First Name') }
    it { should have_content('MI') }
    it { should have_content('USMS Number') }
    it { should have_content('LMSC') }
    it { should have_content('Check In') }
  end

  describe 'on desktop view' do
    it { should_not have_content('Phone Number') }
    it { should have_content('Full Name') }
    it { should have_selector('h1', text: 'Check In') }
  end

  describe 'should display swimmers' do
    # tests for angular tags in ng-repeat
    it { should have_content('swimmer.first_name') }
    it { should have_content('swimmer.last_name') }
    it { should have_content('swimmer.mi') }
    it { should have_content('swimmer.usms_number') }
    it { should have_content('swimmer.lmsc') }
  end

  describe 'footer links' do
    it { should have_content('Load More') }
    it { should have_link('Search Out of State') }
  end
end
