class CoffeeMachine
  def initialize(power, max_water, max_beans)
    @power, @max_water, @max_beans = power, max_water, max_beans
    @cur_water, @cur_beans = @max_water, @max_beans
  end

  def switch
    @power != @power
  end

  def fill_basket
    @cur_water, @cur_beans = @max_water, @max_beans
  end

  def make_coffee
    if @power != true
      puts "machine is off"
    elsif @cur_beans < 10 || @cur_water < 30
      puts "not enough products!"
    else
      puts 'making new coffee....'
      puts 'ready! please, take your coffee'
      @cur_beans -= 10
      @cur_water -= 30
    end
  end
end


class CoffeeMachinePro < CoffeeMachine

  def initialize(power, max_water, max_beans, max_milk_powder)
    super(power, max_water, max_beans)
    @max_milk_powder = max_milk_powder
    @cur_milk_powder = @max_milk_powder
  end

  def make_capuchino
    if @power != true
      puts "machine is off"
    elsif @cur_beans < 5 || @cur_water < 30
      puts "not enough products!"
    else
      puts 'making new coffee....'
      puts 'ready! please, take your capuchino'
      @cur_beans -= 5
      @cur_water -= 30
    end
  end

  def make_latte
    if @power != true
      puts "machine is off"
    elsif @cur_beans < 10 || @cur_water < 30 || @cur_milk_powder < 10
      puts "not enough products!"
    else
      puts 'making new coffee....'
      puts 'ready! please, take your latte'
      @cur_beans -= 10
      @cur_water -= 30
      @cur_milk_powder -= 10
    end
  end

  def make_strong_coffee
    if @power != true
      puts "machine is off"
    elsif @cur_beans < 22 || @cur_water < 30
      puts "not enough products!"
    else
      puts 'making new coffee....'
      puts 'ready! please, take your strong coffee'
      @cur_beans -= 22
      @cur_water -= 30
    end
  end
end

class CoffeeMachineMax < CoffeeMachine
  def make_coffee(beans, water)
    if @power != true
      puts "machine is off"
    elsif @cur_beans < beans || @cur_water < water
      puts "not enough products"
    else
      puts "making your order"
      puts 'ready! please, take you order'
    end
  end
end

class CoffeeMachineProMax < CoffeeMachine

  def initialize(power, max_water, max_beans)
    super(power, max_water, max_beans)
    @temperature = 100
  end

  def temperature(degree)
    if degree < 50 || degree >100
      puts 'bad data! temperature only from 50 to 100!'
    else
    @temperature = degree
    end
  end

  def make_coffee(beans, water)
    if @power != true
      puts "machine is off"
    elsif @cur_beans < beans || @cur_water < water
      puts "not enough products"
    else
      puts "making your order; temperature is: #{@temperature}"
      puts "ready! please, take you order with temperature #{@temperature}"
    end
  end
end


first = CoffeeMachine.new(true, 100, 100)
first.make_coffee

second = CoffeeMachinePro.new(true, 100, 100, 100)
second.make_latte

third = CoffeeMachineMax.new(true, 100, 100)
third.make_coffee(30,50)

fourth = CoffeeMachineProMax.new(true, 100, 100)
fourth.temperature(70)
fourth.make_coffee(30,60)