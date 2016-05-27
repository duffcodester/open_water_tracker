# rubocop:disable all
require 'csv'
require 'open-uri'

URL = 'http://www.usms.org/reg/members/jqs/searchmembers.php?RegYear=2016&oper=csv&_search=false&nd=1396542916605&rows=200&page=1&sidx=BinaryLastName+asc%2C+FirstName+asc%2C+RegDate&sord=asc&totalrows=-1'

module Importer
  $colorado_count = 0

  def self.import
    ActiveRecord::Base.transaction do
      @usms_count = 0
      CSV.foreach(open_file,
                  headers: true,
                  header_converters: :symbol) do |row|
        update_or_create_swimmer(row)
        @usms_count += 1
      end
      puts 'done'
    end
  end

  def self.open_file
    open(URL).path
  end

  def self.update_or_create_swimmer(row)
    if find_swimmer(row)
      update_swimmer(row)
    else
      create_colorado_swimmer(row) if from_colorado?(row)
    end
  end

  def self.find_swimmer(row)
    @swimmer = Swimmer.find_by(usms_number: row[:usms_number])
  end

  def self.update_swimmer(row)
    @swimmer.update_attributes(first_name: row[:first_name],
                               last_name:  row[:last_name],
                               mi:         row[:mi],
                               lmsc:       row[:lmsc])
  end

  def self.from_colorado?(row)
    row[:lmsc] == 'CO'
  end

  def self.create_colorado_swimmer(row)
    Swimmer.where(usms_number: row[:usms_number])
    .first_or_create(first_name: row[:first_name],
                     last_name:  row[:last_name],
                     mi:         row[:mi],
                     lmsc:       row[:lmsc])
    $colorado_count += 1
    puts $colorado_count
  end
end
