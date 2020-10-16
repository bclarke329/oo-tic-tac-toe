require 'pry'
class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")

      end
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2],
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
      
      def input_to_index(input)
        input.to_i - 1
      end 

      def move(index, player="X")
        @board[index] = player
      end 

      def position_taken?(index)
        if @board[index] == " "
            false
        else 
            true
        end 
      end 

      def valid_move?(index)
        if index.between?(0,8) && !(position_taken?(index))
            true 
            end 
        end 

        def turn_count
            @board.count{|token| token == "X" || token == "O"}
        end

        def current_player
            turn_count.odd? ? "O" : "X" 
        end 

        def turn 
            puts "Please enter 1-9"
            input = gets.chomp
            index = input_to_index(input)
        if  valid_move?(index)
            player = current_player
                move(index, player)
                display_board
        else 
            turn
            end
        end 

        # def turn 
        #     puts "Please enter 1-9"
        #     input = gets.chomp
        #     index = input_to_index(input)
        #     player = current_player
        # if valid_move?(index)
        #     move(index, player="X")
        #     display_board
        # else 
        #     puts "Please enter 1-9"
        #     input = gets.chomp
        #     end 
        # end

        def won?
            WIN_COMBINATIONS.each do |winning_combo|
                if position_taken?(winning_combo[0]) && @board[winning_combo[0]] == @board[winning_combo[1]] && @board[winning_combo[2]] == @board[winning_combo[0]]
                    return winning_combo.uniq 
                end 
            end 
            return false
        end 

        def full?
            @board.all?{|i| i == "X" || i == "O"}
        end 

        def draw?
            if full? && !(won?)
                true
            else
                !(full?) && !(won?) || won?
                false
            end 
        end 

        def over?
            if full? || draw? || won?
                true 
            else 
                false
            end 
        end 

        def winner
            if won?
            return @board[won?[0]]
            end
        end 

        def play
        until over?
            turn
        end 

        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end 
        end 
    

end 