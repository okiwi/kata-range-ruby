require_relative './test_helper'
require_relative './range_integer'

describe RangeInteger do
  
  describe "a null range [0,0]" do
    before do
      @null_range = RangeInteger.new("[0,0]")
    end

    it 'can create a range' do
      @null_range.wont_be_nil
    end

    it 'contains 0' do
      @null_range.contains?(0).must_equal true
    end

    it 'does not contain 1' do
      @null_range.contains?(1).must_equal false
    end
  end

  describe "a range [1,1]" do
    before do
      @range = RangeInteger.new("[1,1]")
    end

    it 'contains 1' do
      @range.contains?(1).must_equal true
    end
  end

  describe "a range [1,3]" do
    before do
      @range = RangeInteger.new("[1,3]")
    end

    it 'does not contain 4' do
      @range.contains?(4).must_equal false
    end
  end

  describe "a range (1,3]" do
    before do
      @range = RangeInteger.new("(1,3]")
    end

    it 'does not contain 1' do
      @range.contains?(1).must_equal false
    end
  end

  describe "a range (1,3)" do
    before do
      @range = RangeInteger.new("(1,3)")
    end

    it 'does not contain 3' do
      @range.contains?(3).must_equal false
    end
  end

end