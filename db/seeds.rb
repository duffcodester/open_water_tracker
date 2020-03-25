Account.destroy_all
User.destroy_all

Account.create!(name: "Development 1")
Account.create!(name: "Development 2")

User.create(first_name: 'Non-Admin',
            last_name: 'User',
            phone_number: '720-387-9691',
            email: 'user@example.com',
            password: 'openwater',
            password_confirmation: 'openwater',
            admin: false,
            account_id: Account.first.id
            )

User.create(first_name: 'Admin',
            last_name: 'User',
            phone_number: '720-387-9691',
            email: 'admin@example.com',
            password: 'openwater',
            password_confirmation: 'openwater',
            admin: true,
            account_id: Account.first.id
            )

100.times do

  Swimmer.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 phone_number: Faker::PhoneNumber.phone_number,
                 phone_added: true,
                 account_id: Account.first.id)

  # swimmers needing phone number before check in
  Swimmer.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 phone_number: nil,
                 account_id: Account.first.id)

  Swimmer.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 phone_number: Faker::PhoneNumber.phone_number,
                 phone_added: true,
                 account_id: Account.last.id)

  # swimmers needing phone number before check in
  Swimmer.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 phone_number: nil,
                 account_id: Account.last.id)
end

100.times do |m|
  monitor = User.first

  3.times do |y|
    # completed swims
    SwimRecord.create(swimmer_id: Swimmer.pluck(:id).sample,
                      check_in: DateTime.now - y.years - m.minutes,
                      check_out: DateTime.now - y.years - m.minutes + 1.hours,
                      completed: true,
                      check_in_user_id: monitor.id,
                      check_out_user_id: monitor.id,
                      check_in_first_name: monitor.first_name,
                      check_in_last_name: monitor.last_name,
                      check_out_first_name: monitor.first_name,
                      check_out_last_name: monitor.last_name)

    # uncompleted swims
    SwimRecord.create(swimmer_id: Swimmer.pluck(:id).sample,
                      check_in: DateTime.now - y.years - m.minutes,
                      check_out: nil,
                      completed: true,
                      check_in_user_id: monitor.id,
                      check_out_user_id: nil,
                      check_in_first_name: monitor.first_name,
                      check_in_last_name: monitor.last_name,
                      check_out_first_name: nil,
                      check_out_last_name: nil)
  end
end