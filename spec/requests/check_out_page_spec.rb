require 'spec_helper'

describe 'Check Out' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
    visit swim_records_path
  end

  subject { page }

  it { should have_title(full_title('Check Out')) }

  describe 'on mobile view' do
    it { should have_content('Last Name') }
    it { should have_content('First Name') }
    it { should have_content('MI') }
    it { should have_content('USMS Number') }
    it { should have_content('LMSC') }
    it { should have_content('Check In') }
    it { should have_selector('h4', text: 'Check Out') }
  end

  describe 'on desktop view' do
    it { should have_content('Phone Number') }
    it { should have_content('Full Name') }
    it { should have_selector('h1', text: 'Check Out') }
  end
end
