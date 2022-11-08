// The 'sudoku' program.
program sudoku.aleo {
    
/**
    * The circuit generates a sudoku puzzle,
    * by constructing a 9x9 puzzle with 9 3x3 sub-puzzles.
    * Each sub-puzzle requires a unique set of numbers 1-9.
    * Each row and column requires a unique set of numbers 1-9.
    * The circuit is constructed by first generating a random
    * permutation of the numbers 1-9, and then assigning each
    * number to a row and column in the puzzle.
    * Any unset cells on the puzzle grid are set to 0.
    */

    //Struct to store Rows
    struct Row {
        c1: u8,
        c2: u8,
        c3: u8,
        c4: u8,
        c5: u8,
        c6: u8,
        c7: u8,
        c8: u8,
        c9: u8,
    }

    //A sudoku board
    struct Board {
        r1: Row,
        r2: Row,
        r3: Row,
        r4: Row,
        r5: Row,
        r6: Row,
        r7: Row,
        r8: Row,
        r9: Row,
    }

    // Returns an a random Unsolved board
    // Any unset cells on the puzzle grid are set to 0.
    transition unsolved() -> Board {
        return Board {
            r1: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r2: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r3: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r4: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r5: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r6: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r7: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r8: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },
            r9: Row { c1: 0u8, c2: 0u8, c3: 0u8, c4: 0u8, c5: 0u8, c6: 0u8, c7: 0u8, c8: 0u8, c9: 0u8 },

        };
    }



















}
