namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do

    User.create!(first_name: 'Michael',
                 last_name: 'Pierce',
                 phone_number: '720-387-9691',
                 email: 'example@example.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 admin: true
               )

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


    LMSC = %w(MR PC SP PC SE FL SE FG AD MR AM CT FL LE MR NC MR IL GU MD GU PV OH PC AK PC CO)

    200.times do |n|

      Swimmer.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      usms_number: "ABCD-10#{n}",
                      lmsc: LMSC.sample
                      )
    end

    200.times do |n|

      SwimRecord.create!(swimmer_id: rand(199) + 1,
                         check_in: '2014-03-20 18:28:06',
                         check_out: '2014-03-20 19:35:06',
                         user_id: rand(19) + 1)
    end
  end
end
