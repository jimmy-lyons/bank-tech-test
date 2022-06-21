class Formatter
  
  def self.deposit_confirmation(value, new_balance)

    statement = "Credit: £#{sprintf('%.2f', value)}, New Balance: £#{sprintf('%.2f', new_balance)}"
    p statement
    return statement
  end

end