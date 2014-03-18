require 'spec_helper'

describe 'Users Page' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
    visit users_path
  end

  subject { page }

  it { should have_title('COMSA Tracker | Users') }
  it { should have_selector('h1', text: 'Users') }
  it { should have_content('Last Name') }
  it { should have_content('First Name') }
  it { should have_content('Email') }
  it { should have_content('Admin') }
  it { should have_content('Add User') }
end
