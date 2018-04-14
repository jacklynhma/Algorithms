def test(answer, result)
  if answer == result
    print "Correct"
  else
    print "Answer: #{answer} Result: #{result}"
  end
end

def calculate_new_record(min_record, current_number)
  new_record = min_record.dup
  new_record[0] += 1
  new_record.push(current_number)
  return new_record
end

def minimum_operations(x)
  # history of all the out puts
  # index represents the input
  record = [[], [0, 1]]
  current_number = 2
  while current_number <= x
    new_record = []

    min_record = record[current_number - 1]
    min_count = record[current_number - 1][0] + 1

    if current_number % 3 == 0 && ((record[current_number/3][0] + 1 ) < min_count)
      min_count = record[current_number/3][0] + 1
      min_record = record[current_number/3]
    end

    if current_number % 2 == 0 && ((record[current_number/2][0] + 1 ) < min_count)
      min_count = record[current_number/2][0] + 1
      min_record = record[current_number/2]
    end

    new_record = calculate_new_record(min_record, current_number)
    record.push(new_record)
    current_number += 1
  end
  record
end
number = 85943
# answer = [number_of_operation, history_after_operations_applied]
answer = [18, 1, 3, 4, 12, 13, 39, 117, 351, 352, 353, 1059, 1060, 1061, 3183, 9549, 28647, 85941, 85942, 85943]
print test(minimum_operations(number).last, answer)
