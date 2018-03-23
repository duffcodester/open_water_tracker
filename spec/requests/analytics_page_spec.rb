require 'spec_helper'

describe 'Analytics' do
  let!(:admin) { FactoryGirl.create(:admin) }

  before do
    login_as(admin, scope: :user)
    visit analytics_path
  end

  subject { page }

  it { should have_title(full_title('Analytics')) }

  describe 'on desktop view' do
    it { should have_selector('h1', text: 'Analytics') }
  end
end
