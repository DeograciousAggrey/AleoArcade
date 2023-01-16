program sudoku.leo {
    // A 9x9 array representing a sudoku puzzle
    struct Puzzle {
        cells: [[u8; 9]; 9]
    }

    // Returns true if the puzzle is solved and valid, false otherwise.
    fn is_valid_solution(puzzle: Puzzle) -> bool {
        // Check if all cells contain a number between 1 and 9
        for i in 0..9 {
            for j in 0..9 {
                if puzzle.cells[i][j] < 1 || puzzle.cells[i][j] > 9 {
                    return false;
                }
            }
        }

        // Check if each row contains unique numbers
        for i in 0..9 {
            let mut set = [false; 9];
            for j in 0..9 {
                if set[puzzle.cells[i][j] - 1] {
                    return false;
                }
                set[puzzle.cells[i][j] - 1] = true;
            }
        }

        // Check if each column contains unique numbers
        for j in 0..9 {
            let mut set = [false; 9];
            for i in 0..9 {
                if set[puzzle.cells[i][j] - 1] {
                    return false;
                }
                set[puzzle.cells[i][j] - 1] = true;
            }
        }

        // Check if each 3x3 square contains unique numbers
        for i in 0..3 {
            for j in 0..3 {
                let mut set = [false; 9];
                for k in 0..3 {
                    for l in 0..3 {
                        let row = i * 3 + k;
                        let col = j * 3 + l;
                        if set[puzzle.cells[row][col] - 1] {
                            return false;
                        }
                        set[puzzle.cells[row][col] - 1] = true;
                    }
                }
            }
        }

        return true;
    }
}
