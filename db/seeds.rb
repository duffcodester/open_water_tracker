Account.destroy_all
User.destroy_all

Account.create!(name: "Development")

User.create!(first_name: 'Non-Admin',
             last_name: 'User',
             phone_number: '720-387-9691',
             email: 'user@example.com',
             password: 'openwater',
             password_confirmation: 'openwater',
             admin: false,
             account_id: Account.first.id
             )

User.create!(first_name: 'Admin',
             last_name: 'User',
             phone_number: '720-387-9691',
             email: 'admin@example.com',
             password: 'openwater',
             password_confirmation: 'openwater',
             admin: true,
             account_id: Account.first.id
             )