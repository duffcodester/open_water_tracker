class Swimmer < ActiveRecord::Base
  require 'csv'

  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 25 }
  validates_presence_of :usms_number

  has_many :swim_records

  def self.search(query)
    where('last_name like ?', "%#{query}%")
  end
end
