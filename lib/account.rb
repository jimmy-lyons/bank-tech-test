class Account 
  attr_reader :name, :balance

  def initialize(name:)
    @name = name
    @balance = 0
  end
 
  def self.create_account(name)
    return Account.new(name: name)
  end
end