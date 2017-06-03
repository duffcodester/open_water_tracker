require 'spec_helper'
require Rails.root.join('lib/modules/importer')

describe Swimmer do
  before do
    @swimmer = Swimmer.new(first_name:     'First',
                           last_name:      'Last',
                           mi: 'Dubs',
                           phone_number:   '720-387-9691')
  end

  subject { @swimmer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:mi) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:phone_added) }
  it { should respond_to(:swimmer_checked_in) }

  it { should be_valid }

  describe 'when first name is not present' do
    before { @swimmer.first_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when last name is not present' do
    before { @swimmer.last_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when first name is too long' do
    before { @swimmer.first_name = 'a' * 16 }
    it { should_not be_valid }
  end

  describe 'when last name is too long' do
    before { @swimmer.last_name = 'a' * 26 }
    it { should_not be_valid }
  end
end
