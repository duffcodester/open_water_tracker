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
    #tests for angular tags in ng-repeat
    it { should have_content('swim_record.first_name') }
    it { should have_content('swim_record.last_name') }
    it { should have_content('swim_record.check_in') }
  end
end
