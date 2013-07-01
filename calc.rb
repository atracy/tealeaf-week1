# Calculator Class

class Mymath
  def multiply(num1, num2)
    return num1.to_i * num2.to_i
  end

  def divide(num1, num2)
    return num1.to_f / num2.to_f
  end

  def add(num1, num2)
    return num1.to_i + num2.to_i
  end

  def subtract(num1, num2)
    return num1.to_i - num2.to_i
  end
end

calc = Mymath.new

print 'Please enter a number: '
firstnum = gets.chomp!
print 'Please enter a second number: '
secondnum = gets.chomp!
isoperator = false

while isoperator == false
  print 'please enter an operation (+, -, *, /)'
  oper = gets.chomp!
  if oper == '+' || oper == '-' || oper == '*' || oper == '/'
    isoperator = true
  else
    puts "whoops! you entered #{oper} which isn't an operator.
Please try again"
  end
end

if oper == '+'
  puts "your answer is: #{calc.add firstnum, secondnum}"
elsif oper == '-'
  puts "your answer is: #{calc.subtract firstnum, secondnum}"
elsif oper == '*'
  puts "your answer is: #{calc.multiply firstnum, secondnum}"
elsif oper == '/'
  puts "your answer is: #{calc.divide firstnum, secondnum}"
end
