require_relative 'third_task'

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
    p 'ready'
  end

  def pour(obj, amount)
    if obj.amount + amount < obj.max_amount
      obj.amount += amount
      p 'finally drink'
      obj.product = @product
      @product = nil
    end

  end
end


cup = Cup.new(10)
maker = Coffeemaker.new(100, 30)

loop do # user's interface
  puts '-'.center(40, '-')
  puts 'input command:'
  puts 'q - quit, add - add any ingredient, order - make your order, pour - pour how much how you want'
  name = gets.chomp
  case name
  when 'q' then break
  when 'add'
    puts 'input type and amount of product'
    t = gets.chomp
    a = gets.chomp.to_i
    maker.add(t,a)
  when 'order'
    puts 'input type, beans amount and water amount'
    t = gets.chomp
    w = gets.chomp.to_i
    b = gets.chomp.to_i
    maker.choose_product(t,w,b)
  when 'pour'
    puts 'input amount'
    a = gets.chomp.to_i
    maker.pour(cup,a)
  when 'drink'
    cup.drink
  else
    puts 'wrong data'.center(40, '-')
  end
end
