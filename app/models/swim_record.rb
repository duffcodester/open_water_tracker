class SwimRecord < ActiveRecord::Base
  belongs_to :swimmer
  belongs_to :user

  validates_presence_of :swimmer_id, :check_in_user_id, :check_in

  comma do
    swimmer last_name: 'Last Name'
    swimmer first_name: 'First Name'
    swimmer middle_initial: 'Middle Initial'
    swimmer usms_number: 'USMS'
    swimmer lmsc: 'LMSC'
    check_in 'Check In'
    check_in_user_id 'User'
    check_out 'Check Out'
    check_out_user_id 'User'
  end
end
