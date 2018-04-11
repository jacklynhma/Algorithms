require "byebug"
# 0 base index

# def test(input, answer)
#   data = input.split().map(&:to_i)
#  #
#   i = (data.shift - 2 )/ 2
#   values = data
#   switches = 0
#   answers = ""
#   smallest_index = (data.length - 2 )/ 2
#   i = smallest_index
#
#   # segments = data[1..2*n].each_slice(2).to_a.map { |e| Segment.new(e[0], e[1]) }
#   result = organizing(answers, switches, i, values, smallest_index)
#   if result == answer
#     puts "correct!"
#   else
#     puts "Got: #{result} \n Result: #{answer}"
#   end
# end

def right_index(i)
  (2 * i) + 2
end

def left_index(i)
  (2 * i) + 1
end

def print_swaps(switches, answers)
  answer = "#{switches}#{answers}"
  return answer
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

def swap(data, smallest_index)
  # switching variables
  # variable that is being over written is assigned to a varriable
  save = data[smallest_index]
  # so that i can assign another variable
  data[smallest_index] = data[current_index]
  # this variable is not assigned the variable i saved
  data[current_index] = save
end

def build_heap(answers, switches, data)
  # need to subtract by two starting with 0 base index
  # current index = youngest parent
  current_index = (data.length - 2 )/ 2
  smallest_index = current_index
  return print_swaps(switches, answers) if current_index < 0

  right_index = right_index(current_index)
  left_index = left_index(current_index)
  smallest_index = smallest_index(left_index, right_index, data, smallest_index)

  if smallest_index != current_index
    swap(data, smallest_index)

    # save the answer
    answers += " #{current_index} #{smallest_index}"
    # count the number of switches
    switches += 1

    # if the smallest_index is now on the bottom i - 1 where u left off
    if smallest_index > current_index
      current_index -= 1
      smallest_index = current_index
    else
      current_index = smallest_index
    end
  else
    current_index -= 1
    smallest_index = current_index
  end
  build_heap(answers, switches, data)
end
answers = ""
switches = 0
data = [5, 4, 3, 2, 1]
build_heap(answers, switches, data)
