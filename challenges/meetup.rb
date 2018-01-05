require 'date'
DAYS_IN_MONTH = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
  7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }
TEENTH = [13, 14, 15, 16, 17, 18, 19]

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @days_in_month = DAYS_IN_MONTH[month]
  end

  def day(weekday, schedule)
    @day_of_week = day_of_week(weekday)
    if schedule == :last
      last_weekday(weekday, schedule)
    elsif schedule == :teenth
      teenth(weekday, schedule)
    else
      whats_the_date?(weekday, schedule)
    end
  end

  def last_weekday(weekday, schedule)
    days = []
    (1..@days_in_month).each do |day|
      date = Date.new(@year, @month, day)
      days << day if date.cwday == @day_of_week
    end
    Date.new(@year, @month, days.last)
  end

  def teenth(weekday, schedule)
    @day_of_week = day_of_week(weekday)
    (1..@days_in_month).each do |day|
      date = Date.new(@year, @month, day)
      return Date.new(@year, @month, day) if date.cwday == @day_of_week && TEENTH.include?(day)
    end
  end

  def whats_the_date?(weekday, schedule)
    @day_of_week = day_of_week(weekday)
    limit = occurrence(schedule)
    count = 0
    (1..@days_in_month).each do |day|
      date = Date.new(@year, @month, day).cwday
      count += 1 if date == @day_of_week
      if count == limit
        return Date.new(@year, @month, day)
        break
      end
    end
  end

  def day_of_week(weekday)
    case weekday
    when :monday then 1
    when :tuesday then 2
    when :wednesday then 3
    when :thursday then 4
    when :friday then 5
    when :saturday then 6
    when :sunday then 7
    end
  end

  def occurrence(schedule)
    case schedule
    when :first then 1
    when :second then 2
    when :third then 3
    when :fourth then 4
    end
  end
end
