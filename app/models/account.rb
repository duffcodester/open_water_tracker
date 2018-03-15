class Account < ActiveRecord::Base
	has_many :users
  has_many :swimmers
  has_many :swim_records
end
