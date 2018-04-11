def test(current_value, expected_answer)
  if current_value == expected_answer
    return "Correct!!"
  else
    return "Result: #{current_value}"
  end
end

def sort(items)
  items = items.sort_by { |item| item[:ratio] }
  items.reverse!
  return items
end

def determine_ratio(items)
  items.each do |item|
    item[:ratio] = item[:value] / item[:weight]
  end
end

def max_value(items, max_weight)
  items = determine_ratio(items)
  ordered_items = sort(items)

  current_weight = 0
  current_value = 0
  x = 0

  while (current_weight <= max_weight) && (x < items.length - 1)
    item = ordered_items[x]
    value = item[:value]
    weight = item[:weight]
    ratio = item[:ratio]

    if current_weight + weight <= max_weight
      remaining_weight = max_weight - current_weight
      quantity = remaining_weight / weight
      current_value += (quantity * value)
      current_weight += weight * quantity
    end
    x += 1
  end
  return current_value
end

max_weight = 100
expected_answer = 15
items = [
  { value: 20, weight: 40 },
  { value: 3, weight: 50 },
  { value: 5, weight: 30 }
]

current_value = max_value(items, max_weight)
print test(current_value, expected_answer)

# RunTime: 0.03 seconds
