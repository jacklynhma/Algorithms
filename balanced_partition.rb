def test(result, answer)
  if result == answer
    print "Correct!!!"
  else
    print "Result: #{result} Answer: #{answer}"
  end
end
def sum(a)
  total = 0
  a.each do |x|
    total += x
  end
  total
end

def create_row(w, weights, record)
  new_calculation = []
  total = 0

  weights.each_with_index do |weight, index|
    current_coin_index = record.length

    if current_coin_index >= index
      new_calculation.push(0)
    else
      value = weight + weights[current_coin_index]
      new_calculation.push(value)
      total += value
      # checks if the two numbers equal to a third
      # checks if the whole role equals to a third

      if value == w/3 || total == w/3
        return true
      end
    end
  end
  record.push(new_calculation)
  record
end

def  create_table(w, sub_group, weights, record, current_value)
  while record.length  <= weights.length
    record = create_row(w, weights, record)
    if record == 1
      return true
    else
      create_row(w, weights, record)
    end
  end
  # check if it exactly three numbers
  one_third = w/3
  record[0].each do |x|
    if x < one_third && weights.include?(one_third - x)
      return true
    end
  end
  return false
end

def equal_sums?(w, a)
  answer = 0
  if w % 3 != 0
    return false
  else
    weights = a.sort { |x, y| y <=> x}
    first = w / 3
    record = []
    current_value = 0
    sub_group = 1
    record = create_table(w, sub_group, weights, record, current_value)
    record
  end
end

a = [50, 60, 80, 70, 110]
w = a.length
answer = false
result = equal_sums?(w, a)
test(result, answer)
