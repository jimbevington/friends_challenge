require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Alan",
      age: 12,
      monies: 1,
      friends: ["Steve","John","Kenny", "Ally"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Steve",
      age: 15,
      monies: 2,
      friends: ["John"],
      favourites: {
        tv_show: "Baywatch",
        things_to_eat: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Ally",
      age: 18,
      monies: 20,
      friends: ["Alan", "Steve"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      }
    }

    @person4 = {
      name: "John",
      age: 18,
      monies: 20,
      friends: ["Alan", "Steve", "Kenny"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      }
    }

    @person5 = {
      name: "Kenny",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  # 1. For a given person, return their name
  def test_getting_name
    result = get_name(@person5)
    assert_equal("Kenny", result)
  end

  # 2. For a given person, return their favourite tv show
  # (e.g. for @person2, function should return the string "Baywatch")
  def test__get_fave_tv_show
    result = get_fave_tv_show(@person2)
    assert_equal("Baywatch",result)
  end

  # 3. For a given person, check if they like a particular food
  # (e.g. function should return true for @person3 when checked for "stew", false for "spinach")
  def test__get_food_pref_true
    result = get_food_pref(@person3, "stew")
    assert_equal(true,result)
  end

  def test__get_food_pref_false
    result = get_food_pref(@person3, "spinach")
    assert_equal(false,result)
  end

  # 4. For a given person, add a new name to their list of friends
  # (hint: Add a new string to the friends array, then test for the length of the array, not the return value of your add_friend method)
  def test__add_new_friend
    #arrange
    add_new_friend(@person4, "Jim")
    result = @person4[:friends].length()
    assert_equal(4, result)
  end
  # WHY CHECK THIS WAY, because adding it wouldn't return anything

  # 5. For a given person, remove a specific name from their list of friends
  # (hint: Same as above, testing for the length of the array should be sufficient)
  def test__remove_friend
    #arrange
    remove_friend(@person3, "Alan")
    result = @person3[:friends].length()
    assert_equal(1, result)
  end

  # 6. Find the total of everyone's money
  # (hint: use the people array)
  def test__total_monies
    result = total_monies(@people)
    assert_equal(143, result)
  end

  # 7. For two given people, allow the first person to loan a given value of money to the other
  # (hint: you need to pass in the lender, the lendee, and the amount for this function)
  # (hint2: You should test if both the lender's and the lendee's money have changed)
  def test__lend_monies_lender
    lend_monies(@person5, @person1, 50)
    result = @person5[:monies]
    assert_equal(50, result)
  end

  def test__lend_monies_lendee
    lend_monies(@person5, @person1, 50)
    result = @person1[:monies]
    assert_equal(51, result)
  end

  # 8. Find the set of everyone's favourite food joined together
  # (hint: concatenate the favourites/things_to_eat arrays together)
  def test__all_the_foods
    result = all_the_foods(@people)
    assert_equal(["charcuterie", "soup", "bread", "ratatouille", "stew", "spaghetti", "spinach"], result)
  end

  # 9. Find people with no friends
  # (hint: return an array, there might be more people in the future with no friends!)
  def test__no_friends
    result = no_friends(@people)
    assert_equal(["Kenny"], result)
  end

  # Optional, VERY TOUGH
  # 10. Find the people who have the same favourite tv show
  def test__same_fave_tv_show
    result = same_fave_tv_show(@people)
    assert_equal(["Ally", "John"], result)
  end
  # 
  # def test__same_fave_tv_show_2
  #   result = same_fave_tv_show(@people)
  #   assert_equal(["Ally", "John"], result)
  # end

end
