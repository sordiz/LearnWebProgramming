require 'singleton'

class AirConditioner
  MAX_TEMP = 28
  MIN_TEMP = 17

  attr_reader :temperature
  attr_reader :is_on

  include Singleton

  def initialize
    @temperature = 24
    @is_on = false
  end

  def temperature=(value)
    @temperature = value.to_i
    p 'Air conditioner set to: ' + @temperature.to_s
  end

  def switch
    @is_on = !@is_on
  end

  def turn_on
    p 'Air conditioner turned on'
    @is_on = true
  end

  def turn_off
    p 'Air conditioner turned off'
    @is_on = false
  end

  def increment_temperature
    if @is_on && @temperature < MAX_TEMP
      @temperature = @temperature + 1
    end
  end

  def decrement_temperature
    if @is_on && @temperature > MIN_TEMP
      @temperature = @temperature - 1
    end
  end
end
