class BufferEmptyException < StandardError;end
class BufferFullException < StandardError;end

class CircularBuffer
  attr_reader :buffer, :size

  def initialize(size)
    @size = size
    @buffer = []
  end

  def write(item)
    raise BufferFullException.new('The buffer is full!') if buffer.size == size
    buffer << item if item != nil
  end

  def write!(new_item)
    return if new_item == nil
    if buffer.size == size
      buffer.delete_at(0)
      write(new_item)
    else
      write(new_item)
    end
  end

  def read
    raise BufferEmptyException.new('The buffer is empty!') if buffer.empty?
    index = 0
    current_buffer = buffer[index]
    buffer.delete(buffer[index])
    current_buffer
  end

  def clear
    @size.times { @buffer.delete_at(0) }
  end
end
