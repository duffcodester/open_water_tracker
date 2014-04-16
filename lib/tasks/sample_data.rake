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
    MIDDLE_INITIALS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

    200.times do |n|

      Swimmer.create!(first_name: Faker::Name.first_name,
                      middle_initial: MIDDLE_INITIALS.sample,
                      last_name: Faker::Name.last_name,
                      usms_number: "ABCD-10#{n}",
                      lmsc: LMSC.sample,
                      phone_number: [Faker::PhoneNumber.phone_number, nil].sample
                      )
    end

    40.times do |n|

      SwimRecord.create!(swimmer_id: rand(200) + 1,
                         check_in: Time.now,
                         check_out: Time.now + rand(3).hour,
                         check_in_user_id: rand(100) + 1,
                         check_out_user_id: rand(100) + 1,
                         completed: [true, false].sample
                         )
    end

  end
end
