class CreditCheckRedo

  def validate(number)
    flipped = flips_it(number)
    doubled = doubles_it(flipped)
    summed = sums_it(doubled)
    totaled = totals_it(summed)
    valid = valid?(totaled)
    message(valid)
  end

  def flips_it(number)
    number.to_i.digits
  end

  def doubles_it(flipped)
    flipped.map.with_index do |num, index|
      if index.odd?
        num * 2
      else
        num
      end
    end
  end

  def sums_it(doubled)
    doubled.map do |num|
      if num > 9
        num - 9
      else
        num
      end
    end
  end

  def totals_it(summed)
    summed.sum
  end

  def valid?(totaled)
    if totaled % 10 == 0
      true
    else
      false
    end
  end

  def message(valid)
    if valid
      'The number is valid'
    else
      'The number is invalid'
    end
  end

end
