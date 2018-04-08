def binary_search()
  x = 50
  array = [2, 4, 6, 8, 12, 19, 20, 30, 50, 93, 100, 200]
  max = array.length - 1
  min = 0

  answer = ""
  while answer == ""
    middle_index = ( min + ((max - min )/ 2).to_i )

    if x == array[middle_index]
      answer =  middle_index
    # if the numbers are next to each other
    elsif max - min == 1
      if array[max] != x && array[min] != x
        answer = "x does not exist in the array"
      else
        #the min is already checked in line 9
        middle_index = max
        answer = middle_index
      end
    elsif array[middle_index] < x
      min = middle_index
    elsif array[middle_index] > x
      max = middle_index
    end
  end

  if answer == 8
    return "Correct"
  else
    return "Result: #{answer}"
  end
end

# Runtime: 0.03s
puts binary_search
