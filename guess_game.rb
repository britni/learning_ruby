my_number = (rand * 100).to_i
your_number = gets.chomp.to_i
array = []
array << your_number
puts array
latest_array = []

while your_number != my_number && array.length < 5 do

  if my_number > your_number then

    puts "your number is too low. Try again"
    if array.length < 5 then
      your_number = gets.chomp.to_i
      array << your_number
    end
    puts array
    puts array.last(2)
    latest_array = array.last(2)
    puts latest_array
    if latest_array [0] > latest_array [1] then
      puts "Umm, are you listening?"
    end
    if latest_array [1] == latest_array [0] then
      puts "Same number silly!"
    end
  end

  if my_number < your_number then
    puts "your number is too high"
    if array.length < 5 then
      your_number = gets.chomp.to_i
      array << your_number
    end
    puts array
    latest_array = array.last(2)
    if latest_array [0] < latest_array [1] then
      puts "Umm, are you listening?"
    end
    if latest_array [1] == latest_array [0] then
      puts "Same number silly!"
    end
  end

  if my_number == your_number then
    puts "your number is equal to mine. You win!"
    puts array
  end
end

if my_number != your_number && array.length == 5 then
  puts "you lose my number was #{my_number}"
end
