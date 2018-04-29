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
      # checks if the whole row equals to a third

      if value == w/3 || total == w/3
        return "True"
      end
    end
  end
  record.push(new_calculation)
  record
end

def  create_table(w, weights, record, current_value)
  while record.length  <= weights.length
    record = create_row(w, weights, record)
    if record == "True"
      return "True"
    else
      create_row(w, weights, record)
    end
  end
  # check if it is exactly three numbers
  one_third = w/3
  record[0].each do |x|
    if x < one_third && weights.include?(one_third - x)
      return "True"
    end
  end
  return "False"
end

def equal_sums?(w, a)
  if w % 3 != 0
    return "False"
  else
    weights = a.sort { |x, y| y <=> x}
    first = w / 3
    record = []
    current_value = 0
    record = create_table(w, weights, record, current_value)
    record
  end
end
def test(input, answer)
  a = input.split().map(&:to_i).sort
  w = sum(a)
  result = equal_sums?(w, a)

  if answer == result
    print "CORRECT"
  else
    print "INCORRECT"
  end
end
answer = "True"
input = "3 4 5 6"
print test(input, answer)
