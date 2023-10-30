
class Square 
    def initialize (mv)
        @move = mv.to_s
        @occupied = false
    end
    def played (mv)
        @move = mv
        @occupied = true
    end
    def toString ()
        return "[" + @move + "]"
    end
    def getMove ()
        return @move
    end
    def getStatus ()
        return @occupied
    end
end

class Board
    def initialize ()
        @square_array = []
        for i in 1..9 do
            new_square = Square.new(i)
            @square_array.push(new_square)
        end
        @turns = 0
    end
    def toString ()
        @square_array.each_with_index do |sq, i|
            if i % 3 == 0
                print "\n"
            end
            print sq.toString()
        end
        puts
    end

    def move (mv, symbol)
        @square_array[mv].played(symbol)
    end

    def victory ()
        if allEquals(0, 1, 2) || allEquals(3, 4, 5) || allEquals(6, 7, 8) || allEquals(0, 3, 6) || allEquals(4, 1, 7) || allEquals(5, 8, 2) || allEquals(0, 4, 8) || allEquals(4, 6, 2)
            return true
        end
        return false
    end
    def isOccupied (mv)
        return @square_array[mv].getStatus()
    end
    def makeMove (player)
        new_move = gets.chomp.to_i - 1
        if new_move.between?(0,8) == false
            puts "Error, invalid entry"
            puts "Please make another move"
            new_move = gets.chomp.to_i - 1
        end
        if (self.isOccupied(new_move)) == true
            puts "Error, square occupied"
            puts "Please make another move"
            new_move = gets.chomp.to_i - 1
        end
        self.move(new_move, player)
        self.toString()
    end
    def getTurns ()
        return @turns
    end
    def turnTaken ()
        @turns += 1
    end
    private
        def allEquals (box1, box2, box3)
            if @square_array[box1].getMove == @square_array[box2].getMove && @square_array[box1].getMove == @square_array[box3].getMove && @square_array[box3].getMove == @square_array[box2].getMove
                return true
            end
            return false
        end
 
end

def game () 
    new_board = Board.new()
    puts "The positions of the board are numbered 1-9, with the top corner of the board being position #1 and the bottom right of the board being position #9"
    puts
    new_board.toString()
    puts
    puts "When it is your turn, please type the number of the box where you would like to move"
    winner = 2
    until new_board.victory() == true || new_board.getTurns > 8 do
        puts "Player 1, Enter your move: "
        new_board.makeMove("X")
        new_board.turnTaken()
        if new_board.victory() || new_board.getTurns > 8
            winner = 1
            next
        end
        puts "Player 2, Enter your move: "
        new_board.makeMove("O")
        new_board.turnTaken()
    end
    if new_board.victory()
        puts "Player #{winner} wins the game! :)"
    else
        puts "It was a tie"
    end
end

game()

        

