require './view/formatter'

describe 'Formatter Class' do
  describe 'deposit_confirmation' do
    it 'it displays the deposited value and the new balance' do
      expect(Formatter.deposit_confirmation(100.00, 200.00))
      .to eq("Credit: £100.00, New Balance: £200.00")
    end
  end
end