#toh.rb

class toh
	puts "Welcome to Tower of Hanoi!"
	puts "Instructions:"
	puts "First enter which column (</1-3>) you would like to move from, then enter which column (1-3) to move to."
	
	# get height of tower
	def height_of_tower
		puts "How tall should the tower be?"
		height = gets.chomp.to_i
		puts "               TOWER OF HANOI!!!"
		#make array for 1st tower
		tower_a = (1..height).to_a.reverse.map { |e| e.to_s}
		height.times do  
			puts "    #{tower_a[height - 1]}"
			height -= 1
		end
		puts "Tower 1       Tower 2       Tower 3"
	end
	#show current board
	def current_board(height)
		#puts board
		n = height - 1
		a = [] #tower 1
		b = [] # tower 2
		c = [] #tower 3
		puts 

	end	

	def get_first_input
		puts "Enter first move>"
		first_move = gets.chomp

	end

	def get_second_input

	end
	# updates board
	def render

	end

end