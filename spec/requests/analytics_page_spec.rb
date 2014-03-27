require 'spec_helper'

describe 'Analytics' do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:id) { FactoryGirl.create(:analytic) }

  before do
    login_as(admin, scope: :user)
    visit swimmer_analytics_path(:id)
  end

  subject { page }

  it { should have_title('COMSA Tracker | Analytics') }
  it { should have_selector('h1', text: 'Analytics') }
end
