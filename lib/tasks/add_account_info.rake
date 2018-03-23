namespace :db do
  desc 'Fill database with sample data'
  task add_account_info: :environment do
    Account.create(name: 'Colorado Wild Women')

    account = Account.find_by(name: 'Colorado Wild Women')

    if account
      puts "ACCOUNT:"
      puts account.attributes

      puts "UPDATING USERS:"

      # Add all the monitors to the account
      User.all.each do |user|
        puts user.attributes # before update
        user.update(account_id: account.id)
        puts user.attributes # after update
      end

      puts "UPDATING SWIMMERS:"

      # Add all swimmers to the account
      Swimmer.all.each do |swimmer|
        puts swimmer.attributes # before update
        swimmer.update(account_id: account.id)
        puts swimmer.attributes # after update
      end
    end
  end
end
