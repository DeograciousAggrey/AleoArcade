program sudoku.leo {
    // A 9x9 array representing a sudoku puzzle
    struct Puzzle {
        cells: [[u8; 9]; 9]
    }

    // Returns true if the puzzle is solved and valid, false otherwise.
    function is_valid_solution(puzzle: Puzzle) -> bool {
        // Check if all cells contain a number between 1 and 9
        for row in puzzle.cells {
            for cell in row {
                if cell < 1 || cell > 9 || cell == 0 {
                    return false;
                }
            }
        }

        // Check if each row contains unique numbers
        for row in puzzle.cells {
            let mut set = [false; 10];
            for cell in row {
                if set[cell as usize] {
                    return false;
                }
                set[cell as usize] = true;
            }
        }

        // Check if each column contains unique numbers
        for col in 0..9 {
            let mut set = [false; 10];
            for row in puzzle.cells {
                if set[row[col] as usize] {
                    return false;
                }
                set[row[col] as usize] = true;
            }
        }

        // Check if each 3x3 square contains unique numbers
        for i in 0..3 {
            for j in 0..3 {
                let mut set = [false; 10];
                for k in 0..3 {
                    for l in 0..3 {
                        let row = (i * 3) + k;
                        let col = (j * 3) + l;
                        if set[puzzle.cells[row][col] as usize] {
                            return false;
                        }
                        set[puzzle.cells[row][col] as usize] = true;
                    }
                }
            }
        }
        return true;
    }
}
