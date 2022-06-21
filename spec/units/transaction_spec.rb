require 'transaction'

describe 'Transaction Class' do
  it 'is a type of transaction' do
    transaction = Transaction.new
    expect(transaction).to be_an_instance_of Transaction
  end

  describe '.record' do
    it 'records and returns values of a transaction #example 1' do
      new_transaction = Transaction.record(
        user_id: 1, 
        credit: 123.45, 
        debit: 0, 
        balance: 223.45
      )
      expect(new_transaction.user_id).to eq 1
      expect(new_transaction.credit).to eq 123.45
      expect(new_transaction.debit).to eq 0
      expect(new_transaction.balance).to eq 223.45
      expect(new_transaction.transaction_date).not_to be nil
    end

    it 'records and returns values of a transaction #example 2' do
      new_transaction = Transaction.record(
        user_id: 1, 
        credit: 0, 
        debit: 200, 
        balance: 100
      )
      expect(new_transaction.user_id).to eq 1
      expect(new_transaction.credit).to eq 0
      expect(new_transaction.debit).to eq 200
      expect(new_transaction.balance).to eq 100
      expect(new_transaction.transaction_date).not_to be nil
    end
  end

  describe '.statement' do
    it 'returns all statements of specific user' do
      Transaction.record(user_id: 1, credit: 1000, debit: 0, balance: 1000)
      Transaction.record(user_id: 1, credit: 0, debit: 200, balance: 800)
      Transaction.record(user_id: 1, credit: 0, debit: 300, balance: 500)

      Transaction.record(user_id: 2, credit: 2000, debit: 0, balance: 2000)
      Transaction.record(user_id: 2, credit: 0, debit: 1000, balance: 100)
      Transaction.record(user_id: 2, credit: 0, debit: 500, balance: 500)

      user_1_transactions = Transaction.statement(user_id: 1)
      user_2_transactions = Transaction.statement(user_id: 2)

      user_1_transactions.each do | transaction |
        expect(transaction.user_id).to eq 1
      end

      user_2_transactions.each do | transaction |
        expect(transaction.user_id).to eq 2
      end

      expect(user_1_transactions[0].credit).to eq 1000
      expect(user_1_transactions[1].balance).to eq 800
      expect(user_1_transactions[2].debit).to eq 300
    end
  end
end