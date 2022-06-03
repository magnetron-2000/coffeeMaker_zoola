require_relative 'state'

class New_machine < Machine
  attr_accessor :powering

  def initialize(state,power)
    super(state)
    power(power)
  end

  def power(state)
    puts "switch power to #{state.class}"
    @powering = state
    @powering.main = self
  end

  def power_on
    @powering.on
  end

  def power_off
    @powering.off
  end
end

class Power_state
  attr_accessor :main
  def on
    raise NotImplementedError
  end
  def off
    raise NotImplementedError
  end
end

class Power_on < Power_state
  def on
    puts 'power on'
  end
  def off
    @main.change(Power_off.new)
  end
end

class Power_off < Power_state
  def on
    @main.change(Power_on.new)
  end
  def off
    puts 'power off'
  end
end

coffeemaker = New_machine.new(Slow_regime.new, Power_on.new)

coffeemaker.power_on
coffeemaker.power_off