require 'spec_helper'

describe 'Users' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:admin_too) do FactoryGirl.create(:admin, email: 'newuser3@example.com')
  end

  subject { page }

  describe 'new' do
    before do
      Warden.test_reset!
      login_as(admin, scope: :user)
      visit new_user_path
      pp page.body
    end

    let(:submit) { 'Create Monitor' }

    describe 'with invalid information' do
      before { (fill_in 'Password *', with: 'foo', exact: true) }

      it 'should not create a user' do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'First Name *',            with: 'First'
        fill_in 'Last Name *',             with: 'Last'
        fill_in 'Phone Number *',          with: '1234'
        fill_in 'Email *',                 with: 'user@example.com'
        fill_in('Password *',              with: 'foobar77', exact: true)
        fill_in('Password Confirmation *', with: 'foobar77', exact: true)
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
        fill_in('Password *', with: 'foo', exact: true)
        click_button submit
      end

      it 'should not update the user' do
        current_path.should eq user_path(user)
      end

      it { should have_content('Password is too short') }
    end

    describe 'with valid information' do
      before do
        fill_in 'First Name *',              with: 'First'
        fill_in 'Last Name *',               with: 'Last'
        fill_in 'Phone Number *',            with: '1234'
        fill_in 'Email *',                   with: 'user@example.com'
        fill_in('Password *',                with: 'foobar77', exact: true)
        fill_in('Password Confirmation *',   with: 'foobar77', exact: true)
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

      it do should have_selector('h1',
                                 text: "#{user.first_name} #{user.last_name}")
      end
    end

    describe 'should not be able to delete my own admin status' do
      before do
        Warden.test_reset!
        login_as(admin, scope: :user)
        visit user_path(admin)
      end

      it { should_not have_button('Remove Admin') }
    end

    describe 'should be able to delete another users admin status' do
      before do
        Warden.test_reset!
        login_as(admin, scope: :user)
        visit user_path(admin_too)
      end

      it { should have_button('Remove Admin') }
    end

    describe 'as non-admin' do
      before do
        Warden.test_reset!
        login_as(user, scope: :user)
        visit user_path(user)
      end

      it do should have_selector('h1',
                                 text: "#{user.first_name} #{user.last_name}")
      end

      it { should_not have_button('Add Admin') }
    end
  end

  describe 'index' do
    before do
      Warden.test_reset!
      login_as(user, scope: :user)
      visit users_path
    end

    it { should have_title(full_title('Monitors')) }
    it { should have_selector('h1', text: 'Monitors') }
    it { should have_content('Last Name') }
    it { should have_content('First Name') }
    it { should have_content('Email') }
    it { should have_content('Admin') }
    it { should have_content('Phone Number') }
    it { should_not have_content('Add User') }

    describe 'should display swim records' do
      # tests for angular tags in ng-repeat
      it { should have_content('user.first_name') }
      it { should have_content('user.last_name') }
      it { should have_content('user.email') }
      it { should have_content('user.phone_number') }
      it { should have_content('user.admin') }
    end

    describe 'as admin' do
      before do
        Warden.test_reset!
        login_as(admin, scope: :user)
        visit users_path
      end

      it { should have_content('Add Monitor') }
    end
  end
end
