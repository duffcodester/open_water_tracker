User.create!(first_name: 'Michael',
                 last_name: 'Pierce',
                 phone_number: '720-387-9691',
                 email: 'example@example.com',
                 password: 'foobar22',
                 password_confirmation: 'foobar22',
                 admin: true
               )

Analytic.create!(start_date: '2010-01-01',
                     end_date: '2014-12-12')
