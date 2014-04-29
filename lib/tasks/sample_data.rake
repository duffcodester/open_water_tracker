namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do

    200.times do |n|

      User.create!(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   phone_number: Faker::PhoneNumber.phone_number,
                   email: Faker::Internet.email,
                   password: 'foobar22',
                   password_confirmation: 'foobar22',
                   admin: false
                  )
    end

    LMSC = %w(MR PC SP PC SE FL SE FG AD MR AM CT FL LE CO)
    miS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

    20.times do |n|

      Swimmer.create!(first_name: Faker::Name.first_name,
                      mi: miS.sample,
                      last_name: Faker::Name.last_name,
                      usms_number: "ABCD-10#{n}",
                      lmsc: LMSC.sample,
                      phone_number: nil,
                      swimmer_checked_in: false,
                      phone_added: false
                      )
    end

    20.times do |n|

      SwimRecord.create!(swimmer_id: rand(15) + 1,
                         check_in_user_id: rand(15) + 1,
                         check_out_user_id: rand(15) + 1,
                         check_in: Time.now + 8.hours,
                         check_out: Time.now + 8.hours,
                         completed: true)
    end

    20.times do |n|

      SwimRecord.create!(swimmer_id: rand(15) + 1,
                         check_in_user_id: rand(15) + 1,
                         check_out_user_id: rand(15) + 1,
                         check_in: Time.now,
                         check_out: Time.now,
                         completed: true)
    end

  end
end
