# frozen_string_literal: true

class Array
  def sum(start = 0)
    inject(start, &:+)
  end

  def empty?
    self.size.zero? ? true : false
  end
end