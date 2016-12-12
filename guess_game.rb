def hold_guess(guess, the_array)
  the_array << guess
end

def extra_text_low(c1, c2)
  if c1 > c2 then
    puts "Umm, are you listening?"
  end
  if c1 == c2 then
    puts "Same number silly!"
  end
end

def extra_text_high(c1, c2)
  if c1 < c2 then
    puts "Umm, are you listening?"
  end
  if c1 == c2 then
    puts "Same number silly!"
  end
end

my_number = (rand * 100).to_i
your_number = gets.chomp.to_i
array = []
hold_guess(your_number, array)
puts array
latest_array = []

while your_number != my_number && array.length < 5 do

  if my_number > your_number then

    puts "Your number is too low. Try again."
    if array.length < 5 then
      your_number = gets.chomp.to_i
      hold_guess(your_number, array)
    end
    latest_array = array.last(2)
    extra_text_low(latest_array[0], latest_array[1])
  end

  if my_number < your_number then
    puts "Your number is too high."
    if array.length < 5 then
      your_number = gets.chomp.to_i
      hold_guess(your_number, array)
    end

    latest_array = array.last(2)
    extra_text_high(latest_array[0], latest_array[1])
  end

  if my_number == your_number then
    puts "Your number is equal to mine. You win!"
    puts array
  end
end

if my_number != your_number && array.length == 5 then
  puts "You lose. My number was #{my_number}"
end
