class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
        ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

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

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count{|space| space != " "}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
        token = current_player
        move(index, token)
    else
        turn
    end
    display_board
end

def won?
    WIN_COMBINATIONS.any? do |win_combo|
        if position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
            return win_combo
        end
    end
end

def full?
    @board.all? {|i| i == "X" || i == "O"}
end

def draw?
    full? && !won?
end

def over?
    won? || draw?
end

def winner
    if win_combo = won?
        @board[win_combo[0]]
    end
end

def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end

end