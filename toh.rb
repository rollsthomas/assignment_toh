#toh.rb

class Toh

	@@height = 0 #DO I NEED TO INITAILIZE @@height???
	
	def start_game
		puts "Welcome to Tower of Hanoi!"
		puts "Setup Tower:"
	end

	# get height of tower
	def setup
		puts "How tall should the tower be?"
		@@height = gets.chomp.to_i
	end

		#make array for 1st tower
	def setup_tower
		puts "               TOWER OF HANOI!!!"
		tower_a = (1..@@height).to_a.reverse.map { |e| e.to_s}
		@@height.times do  
			puts "    #{tower_a[@@height - 1]}"
			@@height -= 1
		end
		puts "Tower 1       Tower 2       Tower 3"
		puts "Playing Intructions:"
		puts "To move items between columns, enter which column (</1-3>) you would like to move from, then enter which column (1-3) to move to."
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

start = Toh.new
start.start_game
start.setup
start.setup_tower
