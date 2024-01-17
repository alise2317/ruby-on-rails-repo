require 'test_helper'
class CalcTest < ActiveSupport::TestCase
  test 'does not allow duplicate numbers' do
    existing_calc = create(:calc, number: 42)

    new_calc = build(:calc, number: 40)

    assert_not new_calc.valid?
    assert_includes new_calc.errors[:number], 'has already been taken'
  end

  test 'calculates and saves results if number is not present in the database' do
    calc = create(:calc, number: 40)

    result = calc.result

    assert_instance_of Hash, result
    assert calc.flag
  end

  test 'retrieves results from the database if number is already present' do
    existing_calc = create(:calc, number: 40)

    result = existing_calc.result

    assert_instance_of Hash, result
    refute existing_calc.flag
  end
end
