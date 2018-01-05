# My original answer

class Clock
  attr_accessor :min, :hour

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour, min=0)
    Clock.new(hour, min)
  end

  def to_s
    format('%02d:%02d', @hour, @min)
  end

  def +(number)
    if number < 60
      self.min = @min + number
    else
      hours, minutes = number.divmod(60)
      self.hour = @hour + hours
      self.min = @min + minutes
      after_midnight if @hour >= 24
    end
    to_s
  end

  def -(number)
    if number < 60
      self.min = @min - number
    else
      hours, minutes = number.divmod(60)
      self.hour = @hour - hours
      self.min = @min - minutes
       if @min < 0
         self.hour = @hour - 1
         self.min = @min * -1
       end
      before_midnight if @hour <= 0
    end
    to_s
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def after_midnight
    self.hour = @hour - 24
  end

  def before_midnight
    self.hour = 24 + @hour
  end
end

# My answer after refactoring

class Clock
  attr_accessor :min, :hour
  HOURS_IN_A_DAY = 24
  MINUTES_IN_HOUR = 60

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour, min=0)
    Clock.new(hour, min)
  end

  def to_s
    format('%02d:%02d', hour, min)
  end

  def +(number)
    hours, minutes = number.divmod(MINUTES_IN_HOUR)
    self.hour = hour + hours
    self.min = min + minutes
    after_midnight if hour >= HOURS_IN_A_DAY
    to_s
  end

  def -(number)
    hours, minutes = number.divmod(MINUTES_IN_HOUR)
    self.hour = hour - hours
    self.min = min - minutes
    if @min < 0
      self.hour = hour - 1
      self.min = min * -1
    end
    before_midnight if hour <= 0
    to_s
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def after_midnight
    self.hour = hour - HOURS_IN_A_DAY
  end

  def before_midnight
    self.hour = HOURS_IN_A_DAY + hour
  end
end
