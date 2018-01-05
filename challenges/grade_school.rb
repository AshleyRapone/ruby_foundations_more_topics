# My original answer

class School
  attr_accessor :list

  def initialize
    @list = Hash.new([])
  end

  def to_h
    list.sort.to_h
  end

  def add(name, grade)
    (list[grade] += [name]).sort!
  end

  def grade(grade)
    list[grade]
  end
end

# Refactored version after viewing a submitted solution

class School
  attr_accessor :list

  def initialize
    @list = Hash.new { |list, grade| list[grade] = [] }
  end

  def to_h
    list.sort.to_h
  end

  def add(name, grade)
    (list[grade] += [name]).sort!
  end

  def grade(grade)
    list[grade]
  end
end
