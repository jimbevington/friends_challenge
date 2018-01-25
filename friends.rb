def get_name(person)
  return person[:name]
end

def get_fave_tv_show(person)
  return person[:favourites][:tv_show]
end

def get_food_pref(person, food)
  return person[:favourites][:things_to_eat].include?(food)
end

def add_new_friend(person, new_friend)
  person[:friends].push(new_friend)
end

def remove_friend(person, friend)
  person[:friends].delete(friend)
end

def total_monies(people_array)
  total = 0
  for person in people_array
    total += person[:monies]
  end
  return total
end

def lend_monies(lender, lendee, amount)
  lender[:monies] -= amount
  lendee[:monies] += amount
  # lender[:monies] = lender[:monies] - amount
  # lendee[:monies] = lendee[:monies] + amount
end

def all_the_foods(people_array)
  all_foods = [] # make an empty array
  for person in people_array
    all_foods.concat(person[:favourites][:things_to_eat])
  end
  #
  # for person in people_array # loop through all the people
  #   for food in person[:favourites][:things_to_eat] # loop thru food array
  #     all_foods.push(food) # add each food to all_foods array
  #   end
  # end
  return all_foods
end

def no_friends(people_array)
  people_with_no_friends = [] # initialise an empty arrays
  for person in people_array
    if person[:friends].length() == 0
      people_with_no_friends.push(person[:name])
    end
  end
  return people_with_no_friends
end

def same_fave_tv_show(people_array)

  # Put all the shows in an array so the index can be referenced
  tv_shows = [] # to store shows
  # put all the tv shows in an array
  for person in people_array
    tv_shows.push(person[:favourites][:tv_show])
  end

  # if a TV show occurs more than once, store it's index in a new array
  same_show_indices = [] # store indices
  count = 0 # keep tally of indices as we count
  # put indices in an array
  for show in tv_shows
    if tv_shows.count(show) > 1
      same_show_indices.push(count) # push the index into the array
    end
    count += 1 # increment index
  end

  # Use the indices in same_show_indices to reference person :name from the
  # persons array
  same_tv_show_people = []  # somewhere to keep the final list
  for index in same_show_indices
    same_tv_show_people.push(people_array[index][:name])
  end
  return same_tv_show_people
  # # sort the final array alphabetically
  # return same_tv_show_people.sort!
end
# what if they had more than one
