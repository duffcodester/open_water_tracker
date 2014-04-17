require 'spec_helper'

describe 'Sign In Page' do

  before { visit new_user_session_path }

  subject { page }

  it { should have_title('COMSA Tracker | Sign In') }

  describe 'on mobile view' do
    it { should have_selector('h4', text: 'COMSA Tracker') }
  end

  describe 'on desktop view' do
    it { should have_selector('h1', text: 'COMSA Tracker') }
  end
end
