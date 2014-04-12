User.create!(first_name: 'Non-Admin',
             last_name: 'User',
             phone_number: '720-387-9691',
             email: 'user@example.com',
             password: 'comsa1',
             password_confirmation: 'comsa1',
             admin: false
             )

User.create!(first_name: 'Admin',
             last_name: 'User',
             phone_number: '720-387-9691',
             email: 'admin@example.com',
             password: 'comsa1',
             password_confirmation: 'comsa1',
             admin: true
             )

User.create!(first_name: 'Brian',
             last_name: 'Hoyt',
             phone_number: '111-222-3333',
             email: 'bkhoyt@gmail.com',
             password: 'comsa1',
             password_confirmation: 'comsa1',
             admin: true
             )

User.create!(first_name: 'Marcia',
             last_name: 'Anziano',
             phone_number: '111-222-3333',
             email: 'marcia.anziano@gmail.com',
             password: 'comsa1',
             password_confirmation: 'comsa1',
             admin: true
             )

Analytic.create!(start_date: '2014-01-01',
                 end_date: '2014-12-31')
