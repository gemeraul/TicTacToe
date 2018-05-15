class Player

    attr_accessor :name, :mark

    def initialize(name, mark)
        @name = name
        @mark = mark
    end

    def select_box
        puts "#{@name}, its your turn! On which box would you like to add a #{@mark}? "
        puts "Enter your coordinates in the form: 'row' , 'column'. Eg: 1,1 for 1st box"
        gets.strip.split(",").map(&:to_i)
    end

    #TODO: Add responsabilities functions

end