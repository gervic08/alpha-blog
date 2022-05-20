# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Sports')
  end

  test "category model should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save 
    @category2 = Category.new(name: 'Sports')
    assert_not @category2.valid?
  end

  test "name shouldn´t be too short" do
    @category.name = 'IT'
    assert_not @category.valid?
  end

  test "name shouldn´t be so long" do
    @category.name = 'Information & Technology, robotic stuffs and all computers things'
    assert_not @category.valid?
  end
end 
