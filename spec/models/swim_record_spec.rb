require 'spec_helper'

describe SwimRecord do
  before do
    @swim_record = SwimRecord.new(swimmer_id:        1,
                                  check_in:          '2014-01-01 04:56',
                                  check_out:         '2014-01-01 05:06',
                                  check_in_user_id:  1,
                                  check_in_first_name: 'Michael',
                                  check_in_last_name: 'Pierce',
                                  check_out_user_id: 1,
                                  check_out_first_name: 'Josh',
                                  check_out_last_name: 'Duffy',
                                  completed: false
                                  )
  end

  subject { @swim_record }

  it { should respond_to(:swimmer_id) }
  it { should respond_to(:check_in) }
  it { should respond_to(:check_out) }
  it { should respond_to(:check_in_user_id) }
  it { should respond_to(:check_in_first_name) }
  it { should respond_to(:check_in_last_name) }
  it { should respond_to(:check_out_user_id) }
  it { should respond_to(:check_out_first_name) }
  it { should respond_to(:check_out_last_name) }
  it { should respond_to(:completed) }

  it { should be_valid }

  describe 'when swimmer_id is not present' do
    before { @swim_record.swimmer_id = ' ' }
    it { should_not be_valid }
  end

  describe 'when check_in is not present' do
    before { @swim_record.check_in = ' ' }
    it { should_not be_valid }
  end

  describe 'when user_id is not present' do
    before { @swim_record.check_in_user_id = ' ' }
    it { should_not be_valid }
  end
end
