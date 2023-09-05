class Game
    def initialize(size)
        @board = Board.new(size=3)
        @previous_guess = []
    end 

    def prompt
        puts "Please enter a position of the card you'd like to flip (e.g. '2,3')"
        pos = gets.chomp.split('.').map {|el| el.to_i}
        pos
    end

    def make_guess(pos)
        if @previous_guess.empty?
            @previous_guess << pos 
        else
            prev_card = @board[@previous_guess[0]]
            guessed_card = @board[pos]
            if prev_card==guessed_card
                prev_card.reveal
                guessed_card.reveal
            else
                sleep(3)
                prev_card.hide
                guessed_card.hide
            end
            @previous_guess.pop
        end
    end

    def play
        while true
            system("clear")
            @board.render
            guessed_pos = prompt
            make_guess(guessed_pos)
            return if @board.won?
        end
    end
end