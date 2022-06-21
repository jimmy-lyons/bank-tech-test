require 'transaction'

describe 'Transaction Class' do
  it 'is a type of transaction' do
    transaction = Transaction.new
    expect(transaction).to be_an_instance_of Transaction
  end
end