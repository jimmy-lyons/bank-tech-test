class Account 
  attr_reader :name, :balance

  def initialize(name:)
    @name = name
    @balance = 0
  end
 
  def self.create_account(name)
    raise "Input Error: Invalid name." unless name_validation(name)

    return Account.new(name: name)
  end

  private
  
  def self.name_validation(name)
    return false unless name.is_a? String

    if name =~ /\d/
      return false
    end

    true
  end

end