
class Cup
  attr_accessor :amount, :max_amount, :product
  def initialize(max_amount)
    @max_amount, @amount = max_amount, 0
    @product = nil
  end

  def drink
    unless @product.nil?
    p "hm it's good!"
    @product = nil
    @amount = 0
    else
      p "cup is empty!"
    end
  end
end
