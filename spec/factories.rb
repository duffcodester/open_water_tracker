FactoryGirl.define do

  factory :analytic do
    id 1
  end

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

  factory :swimmer do
    first_name            'Swimmer'
    last_name             'Duffy'
    middle_initial        'M'
    usms_number           '1ADE-ABC'
    lmsc                  'CO'
  end

  factory :swim_record do
    swimmer_id            1
    check_in_user_id      1
    check_out_user_id     1
    check_in              '2014-03-20 18:28:06'
    check_out             '2014-03-20 19:31:06'
  end

end
