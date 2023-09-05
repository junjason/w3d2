class Card

    def initialize(value)
        @value = value
        @face_up = false
    end

    def face_up?
        @face_up
    end

    def hide
        !face_up? if @face_up == true
    end

    def reveal
        face_up? if @face_up == false
    end

    def ==(card)
        self.value == card.value
    end

    def to_s
        @value
    end
end