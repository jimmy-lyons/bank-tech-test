require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('bank_tech_test')
else
  DatabaseConnection.setup('bank_tech')
end
