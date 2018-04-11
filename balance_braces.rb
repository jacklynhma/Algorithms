def closed_bracket?(value)
   value == "]" || value == ")" || value == "}"
end

def mismatched?(last_opening_bracket, bracket)
  if( ( last_opening_bracket == "(") && (bracket != ")") ) ||
    ( (last_opening_bracket == "[") && (bracket != "]") ) ||
    ( (last_opening_bracket == "{") && (bracket != "}") )
  end
end

def open_bracket?(value)
   value == "[" || value == "(" || value == "{"
end

def balanced_braces?(array)
  open_brackets = []
  answer = true
  unmatched_brackets = false

  array.each_with_index do |bracket, index|
    # if opening put in array
    break if unmatched_brackets

    # if the last string is an open brace
    if (index == array.length - 1) && open_bracket?(bracket)
      unmatched_brackets  = true
    elsif open_bracket?(bracket)
      open_brackets.push(bracket)
    elsif closed_bracket?(bracket)
      last_opening_bracket = open_brackets.pop
      if last_opening_bracket == nil
        unmatched_brackets = true
      elsif mismatched?(last_opening_bracket, bracket)
        unmatched_brackets = true
      end
    end
  end

  if unmatched_brackets == answer
    puts "Correct"
  else
    puts "Result: #{unmatched_brackets} Answer: #{answer}"
  end
end

array = ["{", "[", "[", ")", "(", ")", "]", "]", "}"]
print balanced_braces?(array)
# Runtime: 0.08s
