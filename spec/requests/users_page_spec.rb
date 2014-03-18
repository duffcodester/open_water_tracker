require 'spec_helper'
require 'pp'

describe 'Users' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }

  subject { page }

  describe 'new' do
    before do
      Warden.test_reset!
      login_as(admin, scope: :user)
      visit new_user_path
    end

    let(:submit) { 'Create User' }

    describe 'with invalid information' do
      before { fill_in 'Password', with: 'foo' }

      it 'should not create a user' do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'First Name',            with: 'First'
        fill_in 'Last Name',             with: 'Last'
        fill_in 'Phone Number',          with: '1234'
        fill_in 'Email',                 with: 'user@example.com'
        fill_in 'Password',              with: 'foobar77'
        fill_in 'Password Confirmation', with: 'foobar77'
      end

      it 'should create a user' do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe 'after saving the user' do
        before { click_button submit }

        it { should have_link('Logout') }
        it { should have_selector('div.alert') }
      end
    end
  end

  describe 'edit' do
    before do
      Warden.test_reset!
      login_as(user, scope: :user)
      visit edit_user_path(user)
    end

    let(:submit) { 'Save Changes' }

    describe 'with invalid information' do
      before do
        fill_in 'Password', with: 'foo'
        click_button submit
      end

      it 'should not update the user' do
        current_path.should eq user_path(user)
      end

      it { should have_content('Password is too short') }
    end

    describe 'with valid information' do
      before do
        fill_in 'First Name',            with: 'First'
        fill_in 'Last Name',             with: 'Last'
        fill_in 'Phone Number',          with: '1234'
        fill_in 'Email',                 with: 'user@example.com'
        fill_in 'Password',              with: 'foobar77'
        fill_in 'Password Confirmation', with: 'foobar77'
        click_button submit
      end

      it 'should redirect to user profile' do
        current_path.should eq user_path(user)
      end

      describe 'after updating the user' do
        it { should have_selector('div.alert') }
      end
    end
  end

  describe 'show' do
    describe 'as admin' do
      before do
        Warden.test_reset!
        login_as(admin, scope: :user)
        visit user_path(user)
      end

      it { should have_selector('h1',
                                text: "#{user.first_name} #{user.last_name}") }
      # it { should have_content('Add Admin') }
    end

    describe 'as non-admin' do
      before do
        Warden.test_reset!
        login_as(user, scope: :user)
        visit user_path(user)
      end

      it { should have_selector('h1',
                                text: "#{user.first_name} #{user.last_name}") }
      it { should_not have_content('Add Admin') }
    end
  end

  describe 'index' do
    before do
      Warden.test_reset!
      login_as(user, scope: :user)
      visit users_path
    end

    it { should have_title('COMSA Tracker | Users') }
    it { should have_selector('h1', text: 'Users') }
    it { should have_content('Last Name') }
    it { should have_content('First Name') }
    it { should have_content('Email') }
    it { should have_content('Admin') }
    it { should_not have_content('Add User') }

    describe 'as admin' do
      before do
        Warden.test_reset!
        login_as(admin, scope: :user)
        visit users_path
      end

      it { should have_content('Add User') }
    end
  end
end
