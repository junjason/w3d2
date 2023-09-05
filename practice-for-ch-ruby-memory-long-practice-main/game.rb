class Game
    def initialize(size)
        @board = Board.new(size=3)
    end 

    def prompt
        puts "Please enter a position of the card you'd like to flip (e.g. '2,3')"
        pos = gets.chomp.split('.').map {|el| el.to_i}
        pos
    end

    def make_guess
        
    end

    def play
        while true
            @board.render
            guessed_pos = prompt
            make_guess(guessed_pos)
            return if @board.won?
        end
    end
end