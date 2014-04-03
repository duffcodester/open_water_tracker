class Swimmer < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 25 }
  validates_presence_of :usms_number, :lmsc

  has_many :swim_records

  def self.import_swimmers_from_usms(usms_swimmers_file)
    CSV.foreach(usms_swimmers_file.path,
                headers: true,
                header_converters: :symbol) do |row|
    end
  end
end
