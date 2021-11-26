

class Transfer 
  attr_reader :user1 
  attr_reader :user2 

  def initialize(user1, user2)
    @user1 = user1.balance 
    @user2 = user2.balance
  end


end