class SwimRecord < ActiveRecord::Base
  belongs_to :swimmer
  belongs_to :user

  validates_presence_of :swimmer_id, :check_in_user_id, :check_in
end
