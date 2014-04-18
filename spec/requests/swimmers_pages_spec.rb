require 'spec_helper'

describe 'Swimmers' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:swimmer) { FactoryGirl.create(:swimmer) }

  subject { page }

  describe 'edit' do
    before do
      Warden.test_reset!
      login_as(user, scope: :user)
      visit edit_swimmer_path(swimmer)
    end

    let(:submit) { 'Save Changes' }

    describe 'page' do
      it do
        should have_selector('h1',
          text: "Update #{swimmer.first_name} #{swimmer.last_name}")
      end
      it { should_not have_content('First Name') }
      it { should_not have_content('Middle Initial') }
      it { should_not have_content('Last Name') }
      it { should_not have_content('USMS Number') }
      it { should_not have_content('LMSC') }
      it { should have_content('Phone Number *') }
    end

    describe 'with valid information' do
      before do
        fill_in 'Phone Number', with: '1234'
        click_button submit
      end

      it 'should redirect to swimmer profile' do
        current_path.should eq swimmer_path(swimmer)
      end

      describe 'after updating the swimmer' do
        it { should have_selector('div.alert') }
      end
    end
  end

  describe 'show' do
    before do
      Warden.test_reset!
      login_as(user, scope: :user)
      visit swimmer_path(swimmer)
    end

    it do
      should have_selector('h1',
                           text: "#{swimmer.first_name} #{swimmer.last_name}")
    end
    it { should have_content('First Name') }
    it { should have_content('Middle Initial') }
    it { should have_content('Last Name') }
    it { should have_content('USMS Number') }
    it { should have_content('LMSC') }
    it { should_not have_content('Phone Number') }
  end

  describe 'import' do
    before do
      Warden.test_reset!
      login_as(user, scope: :user)
      visit swimmers_path
    end

    describe 'from mobile view' do
      let(:submit) { 'Update Local Database' }

      it 'should update the Database' do
        Swimmer.should_receive(:import)
        click_link submit
      end
    end

    describe 'from desktop view' do
      let(:submit) { 'Update Local USMS Database' }

      it 'should update the Database' do
        Swimmer.should_receive(:import)
        click_link submit
      end
    end
  end
end
