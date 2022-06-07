class CoffeeMaker

  def initialize(name, year, bean_volume, material, cup_volume)
    @name, @year, @bean_volume, @material, @cup_volume =
      name, year, bean_volume, material, cup_volume
    @fast_regime, @switchedOn, @temperature, @beans = false, false, 95, 0
  end

  def power
    @switchedOn = !@switchedOn
  end

  def check_power_off
    unless @switchedOn
      puts "Power off! please turn on power"
      true
    end
  end

  def regime
    @fast_regime = !@fast_regime
  end

  def temperature(degree)
    if 70 < degree && degree < 101
      @temperature = degree
    else
      puts "wrong meaning"
    end
  end

  def add_beans(vol)
    if vol.class == Integer
      @beans += vol
    else
      puts "wrong data"
    end
  end

  def make_strong_coffee(beans_amount, water_amount)
    if check_beans_amount(beans_amount) && check_water_amount(water_amount)
      puts "making in processing"
      check_regime
      puts "ready"
      puts "take coffee, please"
    end
  end

  def make_cappuccino(beans_amount, water_amount)
    if check_beans_amount(beans_amount) && check_water_amount(water_amount)
      puts "making in processing"
      check_regime
      puts "ready"
      puts "take cappuccino, please"
    end
  end

  def make_hot_chocolate(beans_amount, water_amount)
    if check_beans_amount(beans_amount) && check_water_amount(water_amount)
      puts "making in processing"
      check_regime
      puts "ready"
      puts "take chocolate, please"
    end
  end

  private
  def check_regime
    unless @fast_regime
      puts 'processing'
    end
  end

  def check_beans_amount(beans_amount)
    if 5 < beans_amount && beans_amount < @bean_volume
      true
    else
      false
    end
  end

  def check_water_amount(water_amount)
    if 20 < water_amount && water_amount < @cup_volume
      true
    else
      false
    end
  end

end

machine = CoffeeMaker.new('super machine',
                          2005,
                          80,
                          'iron',
                          200)


loop do # user's interface
  puts '-'.center(40, '-')
  puts 'input command:'
  puts 'q - quit, power - power on, check power, temperature, add beans, coffee, capuchino, hot chocolate'
  name = gets.chomp
  case name
  when 'q' then break
  when 'power' then machine.power
  when'check power' then machine.check_power_off
  when 'temperature'
    puts 'input degree'
    t = gets.chomp.to_i
    machine.temperature(t)
  when 'add beans'
    puts 'input amount of beans'
    am = gets.chomp.to_i
    machine.add_beans(am)
  when 'coffee'
    puts 'input beans amount and water amount'
    b = gets.chomp.to_i
    w = gets.chomp.to_i
    machine.make_strong_coffee(b,w)
  when 'capuchino'
    puts 'input beans amount and water amount'
    b = gets.chomp.to_i
    w = gets.chomp.to_i
    machine.make_cappuccino(b,w)
  when 'hot chocolate'
    puts 'input beans amount and water amount'
    b = gets.chomp.to_i
    w = gets.chomp.to_i
    machine.make_hot_chocolate(b,w)
  else
    puts 'wrong data'.center(40, '-')
  end
end
