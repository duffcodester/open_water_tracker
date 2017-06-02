class Swimmer < ActiveRecord::Base
  require 'csv'

  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 25 }
  has_many :swim_records

  def self.import(file)
    # :nocov:
    if file && correct_file_type(file)
      ext = File.extname(file.original_filename)[1..-1]
      spreadsheet = Roo::Spreadsheet.open(file.path, extension: ext.to_sym)
      header = spreadsheet.row(1)

      (2..spreadsheet.last_row).each do |i|
        @row = Hash[[header, spreadsheet.row(i)].transpose]
        @swimmer = Swimmer.find_by(first_name: @row['first_name'], last_name: @row['last_name'])

        if @swimmer # existing
          if @swimmer.update(user_hash)
          	puts "updated: " + @swimmer.reload.to_s
          else
            puts "update error" + @swimmer.to_s
          end
        else # create new swimmer
          @swimmer = Swimmer.new(user_hash)

          if @swimmer.save
            puts "created" + @swimmer.reload.to_s
          else
            puts "create error:" + @swimmer.to_s
          end
        end
      end
    end
    # :nocov:
  end

  def self.correct_file_type(file)
    case File.extname(file.original_filename)
      when '.xls' then true
      when '.xlsx' then true
    end
  end

  def self.user_hash
    # :nocov:
    {
      first_name: @row['first_name'].to_s.squish,
      last_name: @row['last_name'].to_s.squish,
      phone_number: @row['phone_number'].to_s.squish
    }
    # :nocov:
  end

end
