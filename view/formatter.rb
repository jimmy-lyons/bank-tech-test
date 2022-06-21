class Formatter
  
  def self.new_account_confirmation(name, id)
    statement = "Thankyou #{name} for joining Bank, your account number is #{id}"
    p statement
    return statement
  end

  def self.deposit_confirmation(value, new_balance)
    statement = "Credit: £#{sprintf('%.2f', value)}, New Balance: £#{sprintf('%.2f', new_balance)}"
    p statement
    return statement
  end

  def self.withdrawl_confirmation(value, new_balance)
    statement = "Debit: £#{sprintf('%.2f', value)}, New Balance: £#{sprintf('%.2f', new_balance)}"
    p statement
    return statement
  end

end