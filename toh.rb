#toh.rb

class Toh

	#@@height = 0 #DO I NEED TO INITAILIZE @@height???

	
	def start_game
		puts "Welcome to Tower of Hanoi!"
		puts "Setup Tower:"
	end

	# get height of tower
	def setup
		puts "How tall should the tower be?"
		@height = gets.chomp.to_i
	end

		#make array for 1st tower
	def setup_tower
		puts "               TOWER OF HANOI!!!"
		@tower_1 = (1..@height).to_a.reverse.map { |e| e.to_i}
		@tower_2 = []#Array.new(@height, "")
		@tower_3 = []#Array.new(@height, "")
		setup_height = @height - 1
		@height.times do
			item = 'o' * @tower_1[setup_height].to_i
			puts @tower_1[setup_height]
			#puts  item
			setup_height -= 1
		end
		puts "Tower 1       Tower 2       Tower 3"
		puts "Playing Intructions:"
		puts "To move items between columns, enter which column (</1-3>) you would like to move from, then enter which column (1-3) to move to."
	end

	def get_first_input
		puts "Enter tower to move from >"
		first_move = gets.chomp.to_i
		if first_move.between?(1, 3) 
			@first_choice = first_move 
			puts "gets first input"
		else
			puts "You must enter  number between 1 and 3"
			get_first_input
		end 
	end

	def get_second_input
		puts "Enter tower to move to>"
		second_move = gets.chomp.to_i
		if second_move.between?(1, 3) 
			@second_choice = second_move.to_i 
			puts "gets second input"
		else
			puts "You must enter  number between 1 and 3"
			get_second_input
		end 
	end

		#checks if tower is empty
	def check_first_choice
		puts "checks first choice"
		if @first_choice == 1 && @tower_1.length > 0
			@moving_item = @tower_1.last
		elsif @first_choice == 2 && @tower_2.length > 0
			@moving_item = @tower_2.last
		elsif @first_choice == 3 && @tower_3.length > 0
			@moving_item = @tower_3.last 
		else
			puts "Can't choose an empty tower!"
			get_first_input
			check_first_choice
			puts "end else first_choice"
			
		end
	end

	#check if second choice top item is greater than @first_choice
	def check_second_choice
		puts "check second choice"
		puts " this is @second_choice: #{@second_choice}"
		puts " this is @second_choice.class: #{@second_choice.class}"
		puts " this is @tower_2.last: #{@tower_2.last}"
		puts " this is @tower_2.last.class: #{@tower_2.last.class}"
		puts "moving item: #{@moving_item}"
		if @second_choice == 1  
			puts "testing second choice here" 
		elsif @second_choice == 2
			puts "testing if 2"
		end
		
		if @second_choice == 1 && (@tower_1.last.to_i >= @moving_item.to_i || @tower_1.last == nil)
			@moving_item = @moving_item
			puts "if secondchoice 1"
		elsif @second_choice == 2 && (@tower_2.last.to_i >= @moving_item.to_i || @tower_2.last == nil)
			@moving_item = @moving_item			
			puts "if secondchoice 2"
		elsif @second_choice == 3	&& (@tower_3.last.to_i >= @moving_item.to_i || @tower_3.last == nil)
			@moving_item = @moving_item
			puts "if secondchoice 3"
		else
			puts "Can't put a number above a lower value!"
			get_second_input
			check_second_choice
			puts "end else second_choice"
		end
	end

	#movs items
	def makes_move
		#checks choices
		
		#remove first choice from tower
		if @first_choice == 1 
			@item = @tower_1.pop
			puts "pop 1"
		elsif @first_choice == 2 
			@item = @tower_2.pop
			puts "pop 2"
		elsif @first_choice == 3 
			@item = @tower_3.pop 
			puts "pop 3"
		end
		#add item to second_choice tower
		if @second_choice == 1 
			@tower_1 << @item
			puts "add to array 1"
		elsif @second_choice == 2 
			@tower_2 << @item
			puts "add to array 2"
			#@tower_2.reverse!
			#@tower_2.pop
		elsif @second_choice == 3	
			@tower_3 << @item
			puts "add to array 3"
			#@tower_3.pop
		end
	end
	# updates board
	def render
		n = @height - 1 #sets height of tower to be built
		until n < 0 do
			tower_1_o = 'o' * @tower_1[n].to_i
			tower_2_o = 'o' * @tower_2[n].to_i
			tower_3_o = 'o' * @tower_3[n].to_i
	  	#puts "#{`tower_1_o}            #{tower_2_o}           #{tower_3_o} "
	  	puts "#{@tower_1[n]}                #{@tower_2[n]}             #{@tower_3[n]}"
	  	n -= 1
		end
		puts "Tower 1       Tower 2       Tower 3"
	end
	def run_game
		
		until @tower_3[@height - 1] == "1" do
			puts "run game 1"
			get_first_input
			puts "run game 2"
			check_first_choice
			get_second_input
			puts "run game 3"
			check_second_choice			
			puts "run game 4"
			makes_move
			puts "run game 5"
			render
		end
	end
end

start = Toh.new
start.start_game
start.setup
start.setup_tower
start.run_game
puts "Great Job!!!"