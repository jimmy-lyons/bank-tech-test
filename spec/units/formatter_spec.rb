require './view/formatter'

describe 'Formatter Class' do
  describe 'new_account_confirmation' do
    it 'Displays the account name and id' do
      expect(Formatter.new_account_confirmation('Joe Bloggs', 123))
      .to eq("Thankyou Joe Bloggs for joining Bank, your account number is 123")
    end
  end
  
  describe 'deposit_confirmation' do
    it 'it displays the deposited value and the new balance' do
      expect(Formatter.deposit_confirmation(100.00, 200.00))
      .to eq("Credit: £100.00, New Balance: £200.00")
    end
    
    it 'it displays the deposited value and the new balance' do
      expect(Formatter.deposit_confirmation(100.2, 200.2))
      .to eq("Credit: £100.20, New Balance: £200.20")
    end

    it 'it displays the deposited value and the new balance' do
      expect(Formatter.deposit_confirmation(100, 200))
      .to eq("Credit: £100.00, New Balance: £200.00")
    end
  end
end