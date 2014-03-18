require 'spec_helper'

describe Swimmer do
  before do
    @swimmer = Swimmer.new(first_name:   'First',
                           last_name:    'Last',
                           usms_number:  'ABCD-1234',
                           lmsc:         'CO'
                           )
  end

  subject { @swimmer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:usms_number) }
  it { should respond_to(:lmsc) }
  it { should be_valid }

  describe 'when first name is not present' do
    before { @swimmer.first_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when last name is not present' do
    before { @swimmer.last_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when usms_number is not present' do
    before { @swimmer.usms_number = ' ' }
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

  describe 'when lmsc is not present' do
    before { @swimmer.lmsc = ' ' }
    it { should_not be_valid }
  end
end
