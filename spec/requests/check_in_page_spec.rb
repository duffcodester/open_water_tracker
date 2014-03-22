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

  it { should have_title('COMSA Tracker | Check In') }
  it { should have_selector('h1', text: 'Check In') }
  it { should have_content('Last Name') }
  it { should have_content('First Name') }
  it { should have_content('MI') }
  it { should have_content('USMS Number') }
  it { should have_content('LMSC') }

  describe 'should display swimmers' do
    # tests for angular tags in ng-repeat
    it { should have_content('swimmer.first_name') }
    it { should have_content('swimmer.last_name') }
    it { should have_content('swimmer.middle_initial') }
    it { should have_content('swimmer.usms_number') }
    it { should have_content('swimmer.lmsc') }
  end
end
