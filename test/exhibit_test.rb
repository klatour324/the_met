require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'

class ExhibitTest < Minitest::Test
  def test_it_exists_with_attributes
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    assert_instance_of Exhibit, exhibit
    assert_equal "Gems and Minerals", exhibit.name
    assert_equal 0, exhibit.cost
  end
end
# # => #<Exhibit:0x00007fcb13bd22d0...>
#
# pry(main)> exhibit.name
# # => "Gems and Minerals"
#
# pry(main)> exhibit.cost
# # => 0
