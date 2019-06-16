# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
    All_My_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
                rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
                [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
                [[0, 0], [0, -1], [0, 1], [0, 2]]],
                rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
                rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
                rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
                rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]), # Z
                # new blocks
                [ # 5 block long, two orientations (new block #2)
                [[0, 0], [-1, 0], [-2, 0], [1, 0], [2, 0]],
                [[0, 0], [0, -1], [0, -2], [0, 1], [0, 2]]
                ],
                rotations([[0, 0], [1, 0], [2, 0], [0, 1], [1, 1]]), # new block #1
                rotations([[0, 0], [1, 0], [0, 1]]) # new block # 3
                ]
    Special_Piece = [[[0, 0]]]
    # your enhancements here

    def self.next_piece(board)
        MyPiece.new(All_My_Pieces.sample, board)        
    end

    def self.make_special_piece(board)
        MyPiece.new(Special_Piece[0], board)
    end

end

class MyBoard < Board
  # your enhancements here
    def initialize(game)
        @grid = Array.new(num_rows) {Array.new(num_columns)}
        @current_block = MyPiece.next_piece(self)
        @score = 0
        @game = game
        @delay = 500
        @next_block_stack = []
    end

    def next_piece
        if @next_block_stack.size == 0
            @current_block = MyPiece.next_piece(self)
            @current_pos = nil
        else
            @current_block = @next_block_stack.pop
            @current_pos = nil
        end
    end

    def store_current
        locations = @current_block.current_rotation
        displacement = @current_block.position
        (0..(locations.size - 1)).each{|index| 
        current = locations[index];
        @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
        @current_pos[index]
        }
        remove_filled
        @delay = [@delay - 2, 80].max
    end

    def run
        ran = @current_block.drop_by_one
        if !ran
        store_current
        if !game_over?
            next_piece
        end
        end
        @game.update_score
        draw
    end

    def set_score(new_score)
        @score = new_score
    end

    def add_cheat_block
        @next_block_stack.push(MyPiece.make_special_piece(self))
    end

    def rotate_180
        if !game_over? and @game.is_running?
            @current_block.move(0, 0, 1)
            @current_block.move(0, 0, 1)
        end
        draw
    end
        
end

class MyTetris < Tetris
  # your enhancements here
    def set_board
        @canvas = TetrisCanvas.new
        @board = MyBoard.new(self)
        @canvas.place(@board.block_size * @board.num_rows + 3,
                    @board.block_size * @board.num_columns + 6, 24, 80)
        @board.draw
    end

    def key_bindings  
        super()
        @root.bind('c', proc {self.cheat})
        @root.bind('u', proc {@board.rotate_180})
    end

    def cheat
        curr_score = @board.score
        if curr_score >= 100
            @board.set_score(curr_score - 100)
            @board.add_cheat_block
        end
    end
end


