require 'balance'

describe Account do 

  bal = Account.new("Roddy Rich", 2500, 1234)
  bal2 = Account.new("Johnny Vegas", 2300, 1010)

  it "allows user to display their balance" do 
    expect(bal.display_balance(1234)).to eq("Date: #{Time.now}. Balance: 2500")
  end

  it "does not display balance if pin is incorrect" do 
    expect(bal.display_balance(4321)).to eq("Access denied: Incorrect PIN.")
  end

  it "allows user to withdraw money" do 
    bal.withdraw(1234, 500)
    expect(bal.balance).to eq(2000)
  end

  it "user receives message when withdrawing money" do
    expect(bal.withdraw(1234, 1000)).to eq("Date: #{Time.now}. Withdrew 1000. Balance: 1000")
  end

  it "user cannot withdraw if pin is incorrect" do 
    expect(bal.display_balance(4321)).to eq("Access denied: Incorrect PIN.")
  end

  it "user can deposit money" do 
    expect(bal.deposit(1234, 2000)).to eq("Date: #{Time.now}. Deposited 2000. Balance: 3000")
  end

  it "updates balance correctly following multiple transactions (some with wrong PIN that should not change balance)" do
    bal.withdraw(1234, 2000)
    bal.withdraw(1233, 80)
    bal.deposit(1234, 4000)
    bal.withdraw(1234, 3500)
    bal.withdraw(1234, 550)
    bal.deposit(1234, 150)
    bal.withdraw(4321, 100)
    expect(bal.display_balance(1234)).to eq("Date: #{Time.now}. Balance: 1100")
  end

  it "user cannot withdraw more money than their balance" do
    expect{bal.withdraw(1234, 5000)}.to raise_error("Insufficient funds.")
  end

  it "user can set their own PIN and complete transactions with it" do 
    bal2.withdraw(1010, 300)
    bal2.deposit(1010, 600)
    expect(bal2.display_balance(1010)).to eq("Date: #{Time.now}. Balance: 2600")
  end
end