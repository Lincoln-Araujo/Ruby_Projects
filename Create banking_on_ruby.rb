class Account
  attr_reader :name, :balance
  def initialize (name, balance=100)
    @name = name
    @balance = balance
  end

  private
  def pin 
    @pin = 1234
  end

  private
  def pin_error 
    return "Access denied: incorrect PIN."
  end

  public
  def display_balance (pin_number)
    if pin_number == pin
      puts "Balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  public
  def withdraw (pin_number, amount)
    if amount > @balance
      puts "You have no money enough to withdraw. Your current balance is $#{@balance}." 
    elsif pin_number == pin
      @balance -= amount
      puts "Withdraw #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  public
  def deposit (pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Your deposit of #{amount} has been made. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end
end

checking_account = Account.new("Lincoln", 3000)

checking_account.display_balance(1234)
checking_account.withdraw(1324, 200)
checking_account.withdraw(1234, 10000)
checking_account.withdraw(1234, 500)
checking_account.deposit(1234, 1000)
