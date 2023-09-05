class Board
    CARD_VALUES = "a".."z".to_a
    def initialize(size)
        @grid = Array.new(size) {Array.new(size, "_")}
    end

    def num_empty_tiles
        @grid.flatten.count("_")
    end

    def populate
        until num_empty_tiles == 0
            used = []
            val = CARD_VALUES.sample
            while used.index(val)
                val = CARD_VALUES.sample
            end
            2.times do 
                rand_row = rand(0..@grid.length-1)
                rand_col = rand(0..@grid.length-1)
                @grid[rand_row][rand_col] = Card.new(val)
            end
            used << val
        end
    end

    def render
        @grid.each {|row| p row}
    end

    def won?
        @grid.flatten.all?{|card| card.face_up?}
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        @grid[row][col].reveal
        @grid[row][col].value
    end


end