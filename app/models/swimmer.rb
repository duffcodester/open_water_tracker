class Swimmer < ActiveRecord::Base
  require 'csv'
  require 'open-uri'

  URL = 'http://www.usms.org/reg/members/jqs/searchmembers.php?RegYear=2014&oper=csv&_search=false&nd=1396542916605&rows=200&page=1&sidx=BinaryLastName+asc%2C+FirstName+asc%2C+RegDate&sord=asc&totalrows=-1'

  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 25 }
  validates_presence_of :usms_number, :lmsc

  has_many :swim_records

  def self.import
    CSV.foreach(open_file,
                headers: true,
                header_converters: :symbol) do |row|
      create_swimmer(row) if from_colorado?(row)
      create_out_of_state_swimmer(row) if !from_colorado?(row)
    end
  end

  def self.open_file
    open(URL).path
  end

  def self.from_colorado?(row)
    row[:lmsc] == 'CO'
  end

  def self.create_swimmer(row)
    Swimmer.where(usms_number: row[:usms_number])
    .first_or_create(first_name:      row[:first_name],
                     last_name:       row[:last_name],
                     middle_initial:  row[:mi],
                     lmsc:            row[:lmsc],
                     in_state:        true)
  end

  def self.create_out_of_state_swimmer(row)
    Swimmer.where(usms_number: row[:usms_number])
    .first_or_create(first_name:      row[:first_name],
                     last_name:       row[:last_name],
                     middle_initial:  row[:mi],
                     lmsc:            row[:lmsc],
                     in_state:        false)
  end
end
