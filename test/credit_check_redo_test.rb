require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check_redo'

class CreditCheckRedoTest < Minitest::Test

  def test_it_exists
    credit = CreditCheckRedo.new

    assert_instance_of CreditCheckRedo, credit
  end

  def test_it_can_flip_it
    credit = CreditCheckRedo.new
    number = "12345"

    assert_equal [5,4,3,2,1], credit.flips_it(number)
  end

  def test_it_can_double_odd_indexes
    credit = CreditCheckRedo.new
    flipped = [5,4,3,2,1]

    assert_equal [5,8,3,4,1], credit.doubles_it(flipped)
  end

  def test_it_can_sum_double_digits
    credit = CreditCheckRedo.new
    doubled = [5,16,3,18,1]

    assert_equal [5,7,3,9,1], credit.sums_it(doubled)
  end

  def test_it_can_total_it
    credit = CreditCheckRedo.new
    summed = [5,4,3,2,1]

    assert_equal 15, credit.totals_it(summed)
  end

  def test_it_can_validate_it
    credit = CreditCheckRedo.new
    totaled = 70

    assert credit.valid?(totaled)
    refute credit.valid?(75)
  end

  def test_it_can_output_a_message
    credit = CreditCheckRedo.new
    valid = true
    invalid = false

    assert_equal 'The number is valid', credit.message(valid)
    assert_equal 'The number is invalid', credit.message(invalid)
  end

  def test_it_can_validate
    credit = CreditCheckRedo.new
    valid = '342804633855673'
    invalid = '4024007106512380'

    assert_equal 'The number is valid', credit.validate(valid)
    assert_equal 'The number is invalid', credit.validate(invalid)
  end

end
