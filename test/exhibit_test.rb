require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
class Exhibit_PatronTest < Minitest::Test
  def test_instance
    exhibit = Exhibit.new("Gems and Minerals", 0)
    assert_instance_of Exhibit, exhibit
  end
  def test_name
    exhibit = Exhibit.new("Gems and Minerals", 0)
    assert_equal "Gems and Minerals", exhibit.name
  end
  def test_cost
    exhibit = Exhibit.new("Gems and Minerals", 0)
    assert_equal 0, exhibit.cost
  end
  #====
  def test_patron_instance
    bob = Patron.new("Bob", 20)
    assert_instance_of Patron, bob
  end
  def test_patron_name
    bob = Patron.new("Bob", 20)
    assert_equal "Bob", bob.name
  end
  def test_case_name
    bob = Patron.new("Bob", 20)
    assert_equal 20, bob.spending_money
  end
  def test_interests
    bob = Patron.new("Bob", 20)
    assert_equal [], bob.interests
  end
  def test_that_it_can_add_intrest
    bob = Patron.new("Bob", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end
end
