class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender,receiver, amount)
  
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end 
  
  def valid?
    @receiver.valid? && @sender.valid?
  end 
  
  def execute_transaction 
  
    if (@sender.valid?) && (@receiver.valid?) && (@status != "complete") && (@amount < @sender.balance)
      past_transaction = self
     
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete" 
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance." 
      
    end
     
  end
end
