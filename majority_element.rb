# Big-O(n)
def select_majority_element
  array = [1, 5, 5, 6, 7, 5, 5]
  answer = 5
  result = ""
  majority = array.length / 2
  count = {}

  array.each do |x|
    if count[x] == nil
      count[x] = { quantity: 1, number: x}
    else
      count[x][:quantity] += 1
    end
  end

  count.each do |k, v|
    if v[:quantity] > majority
      result = v[:number]
      break result
    end
  end

  if answer == result
    puts "Correct"
  else
    puts "Answer: #{answer} Result: #{result}"
  end
end

print select_majority_element
