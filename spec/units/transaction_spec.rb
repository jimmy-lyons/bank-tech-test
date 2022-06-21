require 'transaction'

describe 'Transaction Class' do
  it 'is a type of transaction' do
    transaction = Transaction.new
    expect(transaction).to be_an_instance_of Transaction
  end

  describe '.record' do
    it 'records and returns values of a transaction' do
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
    end
  end
end