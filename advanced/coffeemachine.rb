require_relative 'cup'

class Coffeemaker
  def initialize(max_water, max_beans)
    @max_water, @max_beans = max_water, max_beans
    @current_water, @current_beans = 0, 0
    @product = nil
  end

  def add(product, amount)
    case product
    when 'water' then
      if @current_water + amount <= @max_water
          @current_water += amount
      end
    when 'beans' then
      if @current_beans + amount <= @max_beans
        @current_beans += amount
      end
    else
      p "too much #{product}!"
    end
  end

  def choose_product(name, water, beans)
    puts "making #{name}"
    @current_water -= water
    @current_beans -= beans
    @product = name
  end

  def pour(obj, amount)
    if obj.amount + amount < obj.max_amount
      obj.amount += amount
      p 'finally ready'
      obj.product = @product
      @product = nil
    end

  end
end

cup = Cup.new(10)

maker = Coffeemaker.new(100, 30)
maker.add("water", 99)
maker.add('beans', 30)

maker.choose_product("coffee", 5,2)
maker.pour(cup,5)

puts ''
cup.drink
cup.drink