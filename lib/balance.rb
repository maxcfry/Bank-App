require 'transfer'

class Account 
  attr_reader :name
  attr_reader :balance
  attr_reader :pin

  def initialize(name, balance, pin)
    @name = name 
    @balance = balance
    @pin = pin
  end

  def display_balance(pin_number)
    if pin_number == pin
      return "Date: #{Time.now}. Balance: #{balance}"
    else 
      return pin_error
    end
  end

  def withdraw(pin_number, amount)
    if amount > balance 
      raise Exception.new("Insufficient funds.")
    elsif pin_number == pin 
      @balance -= amount
      return "Date: #{Time.now}. Withdrew #{amount}. Balance: #{balance}"      
    else
      return pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == pin 
      @balance += amount 
      return "Date: #{Time.now}. Deposited #{amount}. Balance: #{balance}"
    else 
      return pin_error
    end  
  end

  private
    def pin_error
      return "Access denied: Incorrect PIN."
    end
end

