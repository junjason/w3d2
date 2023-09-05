class Board
    CARD_VALUES = "a".."z".to_a
    def initialize(size)
        @grid = Array.new(size) {Array.new(size, "_")}
    end

    def num_empty_tiles
        @grid.flatten.count("_")
    end

    def valid_pos?(pos)
        row, col = pos
        return true if @grid[row][col] == '_'
        false
    end

    def populate
        until num_empty_tiles == 0
            used_val = []
            val = CARD_VALUES.sample
            while used.index(val)
                val = CARD_VALUES.sample
            end
            2.times do 
                rand_row = rand(0..@grid.length-1)
                rand_col = rand(0..@grid.length-1)
                if valid_pos?([rand_row, rand_col])
                    @grid[rand_row][rand_col] = Card.new(val)
                end
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