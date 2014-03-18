FactoryGirl.define do

  factory :user do
    first_name            'Josh'
    last_name             'Duffy'
    email                 'newuser@example.com'
    password              'foobar77'
    password_confirmation 'foobar77'
    admin                 false
    phone_number          '720-387-9691'
  end

  factory :admin, class: User do
    first_name            'Michael'
    last_name             'Pierce'
    email                 'newuser2@example.com'
    password              'foobar22'
    password_confirmation 'foobar22'
    admin                 true
    phone_number          '720-387-9655'
  end

end
