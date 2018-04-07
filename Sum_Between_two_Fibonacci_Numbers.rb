# SUM of F(0)...F(b) = F(b + 2) - 1

def determine_pattern_mod_10(array)
  i = array.length

  current_value = (array[i - 1] + array[i - 2]) % 10

  array.push(current_value)
  if array[i] == 1 && array[i - 1] == 0
    return array
  else
    determine_pattern_mod_10(array)
  end
end

def last_digits_of_sum(a, b, array)

  pattern = determine_pattern_mod_10([0, 1, 1])

  length_of_pattern = pattern.length - 2

  last_digit_of_b = (b + 2) % length_of_pattern
  last_digit_of_a = (a + 1) % length_of_pattern

  total = pattern[last_digit_of_b] - 1
  extra = pattern[last_digit_of_a] - 1

  # need to account if the total sum's last digit is 0
  if total == 0
    total = 10
  end

  total - extra
end

def calculate_last_digit_sum_between_two_Fibonacci_numbers
  array = [0, 1, 1]
  a = 20
  b = 2000
  answer = 5
  # account if b = 0 && b = 1
  return 0 if a == 0 && b == 0
  return 1 if a == 0 && b == 1
  result = last_digits_of_sum(a, b, array)

  if result < 0
    result *= -1
  end

  if answer == result
    puts "Correct!"
  else
    "Result: #{result}"
  end
end

# total run time: 0.136s
puts calculate_last_digit_sum_between_two_Fibonacci_numbers
