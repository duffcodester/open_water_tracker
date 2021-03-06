require 'spec_helper'

describe 'Sign In Page' do

  before { visit new_user_session_path }

  subject { page }

  it { should have_title(full_title('Monitor Sign In')) }

  describe 'on mobile view' do
    it { should have_content('COMSA TRACKER 1.0') }
  end

  describe 'on desktop view' do
    it { should have_content('COMSA TRACKER 1.0') }
  end
end
