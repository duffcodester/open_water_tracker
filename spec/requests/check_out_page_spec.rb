require 'spec_helper'

describe 'Check Out' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
    visit swim_records_path
  end

  subject { page }

  it { should have_title('COMSA Tracker | Check Out') }
  it { should have_selector('h1', text: 'Check Out') }
  it { should have_content('Last Name') }
  it { should have_content('First Name') }

  describe 'should display swim records' do
    # tests for angular tags in ng-repeat
    it { should have_content('swim_record.swimmer.first_name') }
    it { should have_content('swim_record.swimmer.last_name') }
    it { should have_content('swim_record.check_in') }
  end

  describe 'when clicking the check out button' do
    before do
      click_button 'Check Out'
    end

    it 'should redirect to check out page' do
      current_path.should eq swim_records_path
    end

    describe 'after check out' do
      it { should have_selector('div.alert') }
    end
  end

end
