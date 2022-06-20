class Account 
  attr_reader :name, :balance

  def initialize(name:)
    @name = name
    @balance = 0
  end
 
  def self.create_account(name)
    raise "Input Error: Invalid name." unless name =~ /\D/
    return Account.new(name: name)
  end
end