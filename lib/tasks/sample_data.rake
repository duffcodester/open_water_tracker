namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    Account.destroy_all
    User.destroy_all
    Swimmer.destroy_all
    SwimRecord.destroy_all

    Account.create!(name: "Account 1")
    Account.create!(name: "Account 2")

    account_ids = Account.pluck('id')

    User.create!(first_name: 'Non-Admin',
                 last_name: 'User',
                 phone_number: '303-921-8628',
                 email: 'user@example.com',
                 password: 'openwater',
                 password_confirmation: 'openwater',
                 admin: false,
                 account_id: account_ids.sample
                 )

    User.create!(first_name: 'Admin',
                 last_name: 'User',
                 phone_number: '303-921-8628',
                 email: 'admin@example.com',
                 password: 'openwater',
                 password_confirmation: 'openwater',
                 admin: true,
                 account_id: account_ids.sample
                 )

    100.times do |n|

      User.create!(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   phone_number: Faker::PhoneNumber.phone_number,
                   email: Faker::Internet.email,
                   password: 'password',
                   password_confirmation: 'password',
                   admin: false,
                   account_id: account_ids.sample)
    end

    100.times do |n|

      User.create!(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   phone_number: Faker::PhoneNumber.phone_number,
                   email: Faker::Internet.email,
                   password: 'password',
                   password_confirmation: 'password',
                   admin: false,
                   account_id: account_ids.sample)
    end

    user_ids = User.pluck('id')

    miS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

    20.times do |n|

      Swimmer.create!(first_name: Faker::Name.first_name,
                      mi: miS.sample,
                      last_name: Faker::Name.last_name,
                      phone_number: nil,
                      swimmer_checked_in: false,
                      account_id: account_ids.sample)
    end

    swimmer_ids = Swimmer.pluck('id')

    20.times do |n|

      SwimRecord.create!(swimmer_id: swimmer_ids.sample,
                         check_in_user_id: user_ids.sample,
                         check_out_user_id: user_ids.sample,
                         check_in: Time.now - 24.hours,
                         check_out: Time.now - 24.hours,
                         completed: true)
    end

    20.times do |n|

      SwimRecord.create!(swimmer_id: swimmer_ids.sample,
                         check_in_user_id: user_ids.sample,
                         check_out_user_id: nil,
                         check_in: Time.now - 24.hours,
                         check_out: nil,
                         completed: false)
    end

    20.times do |n|

      SwimRecord.create!(swimmer_id: swimmer_ids.sample,
                         check_in_user_id: user_ids.sample,
                         check_out_user_id: user_ids.sample,
                         check_in: Time.now - 19.hours,
                         check_out: Time.now - 19.hours,
                         completed: true)
    end
  end
end
