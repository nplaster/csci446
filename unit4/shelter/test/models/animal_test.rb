require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  fixtures :animals
  test "animal attributes must not be empty" do
    animal = Animal.new
    assert animal.invalid?
    assert animal.errors[:name].any?
    assert animal.errors[:description].any?
    assert animal.errors[:age].any?
    assert animal.errors[:image_url].any?
  end
  
  test "animal age must be positive" do
    animal = Animal.new(name: "My Book Title",
    description: "yyy",
    image_url: "zzz.jpg")
    animal.age = -1
    assert animal.invalid?
    assert_equal ["must be greater than or equal to 0"],
    animal.errors[:age]
    animal.age = -6
    assert animal.invalid?
    assert_equal ["must be greater than or equal to 0"],
    animal.errors[:age]
    animal.age = 1
    assert animal.valid?
  end
end
