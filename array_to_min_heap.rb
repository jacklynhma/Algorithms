# 0 base index

def test(answer, result)
  if answer == result
    print "Correct!"
  else
    print "Answer: #{answer} Result: #{result}"
  end
end

def right_index(i)
  (2 * i) + 2
end

def left_index(i)
  (2 * i) + 1
end

def smallest_index(left_index, right_index, data, smallest_index)
  if (left_index < data.length) && (data[left_index] < data[smallest_index])
    smallest_index = left_index
  end
  if (right_index < data.length) && (data[right_index] < data[smallest_index])
    smallest_index = right_index
  end
  smallest_index
end

def swap(data, smallest_index, current_index)
  # switching variables
  # variable that is being over written is assigned to a varriable
  save = data[smallest_index]
  # so that i can assign another variable
  data[smallest_index] = data[current_index]
  # this variable is not assigned the variable i saved
  data[current_index] = save
end

def build_heap(switches, data, lowest_parent_idex, smallest_index, current_index)
  # need to subtract by two starting with 0 base index
  return switches if current_index < 0

  right_index = right_index(current_index)
  left_index = left_index(current_index)
  smallest_index = smallest_index(left_index, right_index, data, smallest_index)

  if smallest_index != current_index
    swap(data, smallest_index, current_index)
    # save the answer
    switches += " #{current_index} #{smallest_index}"
    # count the number of switches

    # if the smallest_index is now on the bottom i - 1 where u left off
    if smallest_index > lowest_parent_idex
      current_index -= 1
      smallest_index = current_index
    else
      current_index = smallest_index
    end
  else
    current_index -= 1
    smallest_index = current_index
  end
  build_heap(switches, data, lowest_parent_idex, smallest_index, current_index)
end


switches = ""
data = [9, 4, 6, 3, 1]
lowest_parent_idex = (data.length - 2 )/ 2
current_index = lowest_parent_idex
smallest_index = lowest_parent_idex
answer = "1 4 0 1 1 3"
result = build_heap(switches, data, lowest_parent_idex, smallest_index, current_index)
test(answer, result)
