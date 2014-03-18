require 'spec_helper'

describe 'Swimmers' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
    visit swimmers_path
  end

  subject { page }

  it { should have_title('COMSA Tracker | Check In') }
  it { should have_selector('h1', text: 'Check In') }
  it { should have_content('Last Name') }
  it { should have_content('First Name') }
end
