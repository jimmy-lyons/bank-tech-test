require './view/formatter'

describe 'Formatter Class' do
  describe '.new_account_confirmation' do
    it 'Displays the account name and id' do
      expect(Formatter.new_account_confirmation('Joe Bloggs', 123))
      .to eq("Thankyou Joe Bloggs for joining Bank, your account number is 123")
    end
  end
  
  describe '.deposit_confirmation' do
    it 'displays the deposited value and the new balance' do
      expect(Formatter.deposit_confirmation(100.00, 200.00))
      .to eq("Credit: £100.00, New Balance: £200.00")
    end
    
    it 'displays the deposited value and the new balance' do
      expect(Formatter.deposit_confirmation(100.2, 200.2))
      .to eq("Credit: £100.20, New Balance: £200.20")
    end

    it 'displays the deposited value and the new balance' do
      expect(Formatter.deposit_confirmation(100, 200))
      .to eq("Credit: £100.00, New Balance: £200.00")
    end
  end

  describe '.withdrawl_confirmation' do
    it 'displays the withdrawn value and the new balance' do
      expect(Formatter.withdrawl_confirmation(123.45, 376.55))
      .to eq("Debit: £123.45, New Balance: £376.55")
    end
  end
end