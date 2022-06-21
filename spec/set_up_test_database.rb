require 'pg'

def set_up_test_database
  p 'Setting up test database'

  connection = PG.connect(dbname: 'bank_tech_test')
  connection.exec('TRUNCATE accounts, transactions;')
end