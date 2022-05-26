
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
    if !@switchedOn
      puts "Power off! please turn on power"
      true
    end
  end

  def regime
    @fast_regime = !@fast_regime
  end

  private
  def check_regime
    if @fast_regime
      puts 'processing'
    end
  end

  def temperature(degree)
    if 70 < degree < 101
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

  private
  def check_beans_amount(beans_amount)
    if 5 < beans_amount < @bean_volume
      true
    else
      false
    end
  end

  private
  def check_water_amount(water_amount)
    if 20 < water_amount < @cup_volume
      true
    else
      false
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

end


machine = CoffeeMaker.new('super machine',
                      2005,
                      80,
                      'iron',
                      200)
