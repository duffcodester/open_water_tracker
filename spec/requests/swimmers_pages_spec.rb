require 'spec_helper'

describe 'Swimmers' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:swimmer) { FactoryGirl.create(:swimmer) }
  let!(:swimmer_with_phone) do
    FactoryGirl.create(:swimmer, phone_number: '3039218628')
  end
  let!(:swimmer_checked_in) do
    FactoryGirl.create(:swimmer,
                       phone_number: '3039218628',
                       swimmer_checked_in: true)
  end

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
        EDIT_H1 = "Update #{swimmer.first_name} #{swimmer.last_name}"
        should have_selector('h1',
                             text: EDIT_H1)
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

    let(:submit) { 'Check In' }

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

    describe 'check in' do
      describe 'with phone number' do
        before do
          Warden.test_reset!
          login_as(user, scope: :user)
          visit swimmer_path(swimmer_with_phone)
        end

        it 'should check in swimmer and redirect to check in page' do
          expect { click_button submit }.to change(SwimRecord, :count).by(1)
          expect(current_path).to eq(swimmers_path)
        end
      end
    end
  end
end
