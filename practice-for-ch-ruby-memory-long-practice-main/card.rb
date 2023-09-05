class Card

    def initialize(value)
        @value = VALUES.sample
        @face_up = false
    end

    def hide
        @face_up = false if @face_up == true
    end

    def reveal
        @face_up = true if @face_up == false
    end

    def face_up?
        @face_up
    end


    

end