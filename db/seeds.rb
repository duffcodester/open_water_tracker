User.create!(first_name: 'Non-Admin',
             last_name: 'User',
             phone_number: '720-387-9691',
             email: 'user@example.com',
             password: 'openwater',
             password_confirmation: 'openwater',
             admin: false
             )

User.create!(first_name: 'Admin',
             last_name: 'User',
             phone_number: '720-387-9691',
             email: 'admin@example.com',
             password: 'openwater',
             password_confirmation: 'openwater',
             admin: true
             )