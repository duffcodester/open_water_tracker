class Swimmer < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 25 }
  validates_presence_of :usms_number, :lmsc
end
