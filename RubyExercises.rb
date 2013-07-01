arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts 'Excercise 1.'
arr.each { |a| puts a }

puts 'Exercise 2.'

arr.each { |a| puts a if a > 5 }

puts 'Exercise 3.'

arr.select { |a| puts a if a.odd? }

puts 'Exercise 4.'

puts arr << 11
puts arr.unshift(0)

puts 'Exercise 5.'
puts arr.pop
puts arr << 3

puts 'Exercise 6.'
puts arr.uniq!

puts 'Exercise 7.'
puts 'arrays are ordered and hashes are not'

puts 'Exercise 8.'
puts "1.8 syntax #{ h = { :a => 1, :b => 2, :c => 3, :d => 4} }"
puts "1.9 syntax #{ myhash = { a: 1, b: 2, c: 3, d: 4 } }"
puts 'Exercise 9.'
puts myhash[:b]

puts 'Exercise 10.'
myhash[:e] = 5
puts myhash[:e]

puts 'Exercise 11.'
puts myhash.delete_if{ |_,v| v < 3.5 }

puts 'Exercise 12.'
puts newhash = { a: [1, 2, 3], b: 'hi there', c: 3 }
puts newarr = [{a: 1, b: 2}, {c: 3}]

puts 'Exercise 13.'
puts 'http://railsapi.com/'
