require_relative './test_helper'
require_relative './range_integer'

describe RangeInteger do
  attr_accessor :range

  def contains(value, ok = true)
    @range.contains?(value).must_equal ok
  end

  def doenst_contain(value)
    contains(value, false)
  end

  describe 'a null range [0,0]' do
    before { @range = RangeInteger.new('[0,0]') }

    it('can create a range') { @range.wont_be_nil }
    it('contains 0') { contains(0) }
    it('does not contain 1') { doenst_contain(1) }
  end

  describe 'a range [1,1]' do
    before { @range = RangeInteger.new('[1,1]') }

    it('contains 1') { contains(1) }
  end

  describe 'a range [1,3]' do
    before { @range = RangeInteger.new('[1,3]') }

    it('does not contain 4') { doenst_contain(4) }
  end

  describe 'a range (1,3]' do
    before { @range = RangeInteger.new('(1,3]') }

    it('does not contain 1') { doenst_contain(1) }
  end

  describe 'a range (1,3)' do
    before { @range = RangeInteger.new('(1,3)') }

    it('does not contain 3') { doenst_contain(3) }
  end
end
