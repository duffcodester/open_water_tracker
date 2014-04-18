require 'spec_helper'
require Rails.root.join('lib/modules/importer')

describe Swimmer do
  before do
    @swimmer = Swimmer.new(first_name:     'First',
                           last_name:      'Last',
                           middle_initial: 'Dubs',
                           usms_number:    'ABCD-1234',
                           lmsc:           'CO',
                           phone_number:   '720-387-9691',
                           in_state:       false
                           )
  end

  subject { @swimmer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:middle_initial) }
  it { should respond_to(:usms_number) }
  it { should respond_to(:lmsc) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:in_state) }
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
  # describe 'read USMS database' do
  #   let(:temp_file) { Tempfile.new('usms_temp') }

  #   before do
  #     CSV.open(temp_file.path, 'wb', headers: true) do |csv|
  #       csv << ['First Name', 'MI', 'Last Name', 'LMSC', 'Club', 'WO Group', 'USMS Number', 'Reg. Date']
  #       csv << ['Robert', 'J', 'Zweben', 'CO', 'CALM', 'N/A', '3842-03HUD', '18/12/2013']
  #       csv << ['Robert', 'J', 'Zweben', 'CO', 'CALM', 'N/A', '3842-03HUD', '18/12/2013']
  #       csv << ['Daniel', nil, 'Zweers', 'PV', 'L4S', 'N/A', '104M-0842C', '01/11/2013']

  #     end

  #     Swimmer.stub(:open).and_return(temp_file)
  #   end

  #   it 'should create new swimmers in local db' do
  #     Swimmer.should_receive(:open).with(Swimmer::URL)
  #     expect { Importer.import }.to change(Swimmer, :count).by(2)
  #     Swimmer.first.first_name.should == 'Robert'
  #     Swimmer.first.in_state.should == true
  #     Swimmer.last.first_name.should == 'Daniel'
  #     Swimmer.last.in_state.should == false
  #   end
  # end
end
