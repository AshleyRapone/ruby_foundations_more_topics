# My original answer

class BeerSong
  def verse(number)
    if number > 1
      bottles = bottles_or_bottle(number)
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"\
      "Take one down and pass it around, #{number - 1} #{bottles} of beer on the wall.\n"
    elsif number == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(end_num, start_num)
    numbers = (start_num..end_num).to_a
    final = numbers.reverse.map do |number|
      verse(number)
    end
    final.join("\n")
  end

  def bottles_or_bottle(number)
    if (number - 1)  > 1
      'bottles'
    elsif (number - 1) == 1
      'bottle'
    end
  end

  def lyrics
    verses(99, 0)
  end
end
