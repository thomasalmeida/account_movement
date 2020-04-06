class Account
  attr_accessor :id, :balance

  def initialize(options = {})
    @id = options[:id]
    @balance =   options[:balance]
  end
end
