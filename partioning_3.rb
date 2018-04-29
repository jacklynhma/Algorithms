require "byebug"

def create_row(w, weights)
  new_calculation = []
  total = 0
  current_row_index = 0
  current_column_index = 0

  while current_row_index < weights.length && current_column_index < weights.length

    if current_column_index <= current_row_index
      new_calculation.push(0)
    else
      weight = weights[current_row_index]
      value = weight + weights[current_column_index]
      new_calculation.push(value)
      total += value

    # checks if the two numbers equal to a third
    # checks if the whole row equals to a third

      if value == w/3
        return { first: current_column_index, second: current_row_index }
      elsif total == w/3
        return new_calculation
      end

      if current_column_index == weights.length - 1
        current_row_index += 1
        new_calculation = []
        total = 0
        current_column_index = 0
      end

    end
    current_column_index += 1
  end
  "False"
end
def calculate_half(w, weights)
  weights.each do |x|

  end
end

def  create_table(w, weights, record, current_value)
  record = create_row(w, weights)
  byebug
  if record.class == Array
    next_value = record.length - 1
    total = 0

    [next_value..record.length-1].each do |x|
      total += x
    end

    if total/2 != w/3
      return "False"
    else
      return "True"
    end

  elsif record.class == Hash
    left_over_weight = w - weights[record[:first]] - weights[record[:second]]

    if left_over_weight/2 != w/3
      return "False"
    end
    weights.delete_at(record[:first])
    weights.delete_at(record[:second])
    answer = calculate_half(w/3, weights)
    byebug
  end
end

def equal_sums?(input)
  w = 0
  a = []
  input.split().each do |x|
    x = x.to_i
    a.push(x)
    w += x
  end

  if w % 3 != 0 || a.detect { |x| x > w/3 }
    return "False"
  else
    weights = a
    current_value = 0
    record = create_table(w, weights, 0, current_value)
    record
  end
end

def test(input, answer)
  result = equal_sums?(input)

  if answer == result
    print "CORRECT"
  else
    print "INCORRECT"
  end
end
answer = "True"
input = "17 59 34 57 17 23 67 1 18 2 59"
# input = "4 5 6 7 8"
print test(input, answer)
