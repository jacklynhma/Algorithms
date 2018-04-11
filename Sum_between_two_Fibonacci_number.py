# import pdb
def test(expected_answer, result):
    if(expected_answer == result):
        return "Correct!"
    else:
        return("Result: %s" %result)
def determine_pattern_mod_10(array):
    i = len(array)
    current_value = (array[i - 1] + array[i - 2]) % 10
    array.append(current_value)

    if(array[i] == 1 and array[i - 1] == 0):
        return array
    else:
        return determine_pattern_mod_10(array)

def last_digits_of_sum(a, b, array):
    pattern = determine_pattern_mod_10(array)
    length_of_pattern = len(pattern) - 2
    last_digit_of_b = (b + 2) % length_of_pattern
    last_digit_of_a = (a + 1) % length_of_pattern

    # takes into consider if last digit of b < last digit of a
    total = pattern[last_digit_of_b] + 10
    extra = pattern[last_digit_of_a]

    # need to account if the total sum's last digit is 0
    return ((total - extra) % 10)

def calculate_last_digit_sum_between_two_Fibonacci_numbers(array, a, b):

    # account if b = 0 && b = 1
    if (a == 0 and b == 0): return 0
    if (a == 0 and b == 1): return 1

    return last_digits_of_sum(a, b, array)

# total run time: 0.081s
array = [0, 1 , 1]
a = 30
b = 45
expected_answer = 4

result = calculate_last_digit_sum_between_two_Fibonacci_numbers(array, a, b)
print(test(expected_answer, result))
