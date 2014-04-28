require 'spec_helper'

describe 'Out of State' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:swimmer) { FactoryGirl.create(:swimmer) }
  let!(:swimmer_with_phone) do
    FactoryGirl.create(:swimmer, phone_number: '3039218628')
  end

  subject { page }

  describe 'show' do
    before do
      Warden.test_reset!
      login_as(user, scope: :user)
      visit out_of_state_path
      fill_in 'search', with: 'duffy'
      click_button 'Search'
    end

    it { should have_title(full_title('Out of State')) }
    it { should have_selector('h1', text: 'Out of State') }

    let(:add) { 'Add to Database' }

    it { should have_content('First Name') }
    it { should have_content('MI') }
    it { should have_content('Last Name') }
    it { should have_content('USMS Number') }
    it { should have_content('LMSC') }
    it { should have_content('Full Name') }

    it { should have_content('Add') }

    describe 'add to local' do
      before do
        Warden.test_reset!
        login_as(user, scope: :user)
        visit out_of_state_path
      end

      # it 'should add out of state swimmer to local database' do
      #   expect { click_link add }.to change(Swimmer, :count).by(1)
      # end
    end
  end
end
