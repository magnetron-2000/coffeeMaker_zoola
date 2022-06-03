class Machine
  attr_accessor :state

  def initialize(state)
    change(state)
  end

  def change(state)
    puts "change state to #{state.class}"
    @state = state
    @state.main = self
  end


  def fast_regime
    @state.f_regime
  end
  def slow_regime
    @state.s_regime
  end
end

class Regime
  attr_accessor :main

  def f_regime
    raise NotImplementedError
  end

  def s_regime
    raise NotImplementedError
  end
end

class Slow_regime < Regime
  def f_regime
    #puts "change to fast regime"
    @main.change(Fast_regime.new)
  end

  def s_regime
    puts "slow regime on"
  end
end

class Fast_regime < Regime
  def f_regime
    puts "fast regime on"
  end

  def s_regime
    #puts "change to slow regime"
    @main.change(Slow_regime.new)
  end
end


coffeemaker = Machine.new(Slow_regime.new)
loop do
  reg = gets.chomp
  case reg
  when 'q'
    break
  when 's'
    coffeemaker.slow_regime
  when 'f'
    coffeemaker.fast_regime
  end
end



