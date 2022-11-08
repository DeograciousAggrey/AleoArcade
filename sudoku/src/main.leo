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

    // Check if the numbers of the board are >=1 and <=9
    // Each number in a solved sudoku board must be between 1 and 9
    function check_numbers(board: Board) -> bool {
        return (board.r1.c1 >= 1u8 && board.r1.c1 <= 9u8) &&
            (board.r1.c2 >= 1u8 && board.r1.c2 <= 9u8) &&
            (board.r1.c3 >= 1u8 && board.r1.c3 <= 9u8) &&
            (board.r1.c4 >= 1u8 && board.r1.c4 <= 9u8) &&
            (board.r1.c5 >= 1u8 && board.r1.c5 <= 9u8) &&
            (board.r1.c6 >= 1u8 && board.r1.c6 <= 9u8) &&
            (board.r1.c7 >= 1u8 && board.r1.c7 <= 9u8) &&
            (board.r1.c8 >= 1u8 && board.r1.c8 <= 9u8) &&
            (board.r1.c9 >= 1u8 && board.r1.c9 <= 9u8) &&
            (board.r2.c1 >= 1u8 && board.r2.c1 <= 9u8) &&
            (board.r2.c2 >= 1u8 && board.r2.c2 <= 9u8) &&
            (board.r2.c3 >= 1u8 && board.r2.c3 <= 9u8) &&
            (board.r2.c4 >= 1u8 && board.r2.c4 <= 9u8) &&
            (board.r2.c5 >= 1u8 && board.r2.c5 <= 9u8) &&
            (board.r2.c6 >= 1u8 && board.r2.c6 <= 9u8) &&
            (board.r2.c7 >= 1u8 && board.r2.c7 <= 9u8) &&
            (board.r2.c8 >= 1u8 && board.r2.c8 <= 9u8) &&
            (board.r2.c9 >= 1u8 && board.r2.c9 <= 9u8) &&
            (board.r3.c1 >= 1u8 && board.r3.c1 <= 9u8) &&
            (board.r3.c2 >= 1u8 && board.r3.c2 <= 9u8) &&
            (board.r3.c3 >= 1u8 && board.r3.c3 <= 9u8) &&
            (board.r3.c4 >= 1u8 && board.r3.c4 <= 9u8) &&
            (board.r3.c5 >= 1u8 && board.r3.c5 <= 9u8) &&
            (board.r3.c6 >= 1u8 && board.r3.c6 <= 9u8) &&
            (board.r3.c7 >= 1u8 && board.r3.c7 <= 9u8) &&
            (board.r3.c8 >= 1u8 && board.r3.c8 <= 9u8) &&
            (board.r3.c9 >= 1u8 && board.r3.c9 <= 9u8) &&
            (board.r4.c1 >= 1u8 && board.r4.c1 <= 9u8) &&
            (board.r4.c2 >= 1u8 && board.r4.c2 <= 9u8) &&
            (board.r4.c3 >= 1u8 && board.r4.c3 <= 9u8) &&
            (board.r4.c4 >= 1u8 && board.r4.c4 <= 9u8) &&
            (board.r4.c5 >= 1u8 && board.r4.c5 <= 9u8) &&
            (board.r4.c6 >= 1u8 && board.r4.c6 <= 9u8) &&
            (board.r4.c7 >= 1u8 && board.r4.c7 <= 9u8) &&
            (board.r4.c8 >= 1u8 && board.r4.c8 <= 9u8) &&
            (board.r4.c9 >= 1u8 && board.r4.c9 <= 9u8) &&
            (board.r5.c1 >= 1u8 && board.r5.c1 <= 9u8) &&
            (board.r5.c2 >= 1u8 && board.r5.c2 <= 9u8) &&
            (board.r5.c3 >= 1u8 && board.r5.c3 <= 9u8) &&
            (board.r5.c4 >= 1u8 && board.r5.c4 <= 9u8) &&
            (board.r5.c5 >= 1u8 && board.r5.c5 <= 9u8) &&
            (board.r5.c6 >= 1u8 && board.r5.c6 <= 9u8) &&
            (board.r5.c7 >= 1u8 && board.r5.c7 <= 9u8) &&
            (board.r5.c8 >= 1u8 && board.r5.c8 <= 9u8) &&
            (board.r5.c9 >= 1u8 && board.r5.c9 <= 9u8) &&
            (board.r6.c1 >= 1u8 && board.r6.c1 <= 9u8) &&
            (board.r6.c2 >= 1u8 && board.r6.c2 <= 9u8) &&
            (board.r6.c3 >= 1u8 && board.r6.c3 <= 9u8) &&
            (board.r6.c4 >= 1u8 && board.r6.c4 <= 9u8) &&
            (board.r6.c5 >= 1u8 && board.r6.c5 <= 9u8) &&
            (board.r6.c6 >= 1u8 && board.r6.c6 <= 9u8) &&
            (board.r6.c7 >= 1u8 && board.r6.c7 <= 9u8) &&
            (board.r6.c8 >= 1u8 && board.r6.c8 <= 9u8) &&
            (board.r6.c9 >= 1u8 && board.r6.c9 <= 9u8) &&
            (board.r7.c1 >= 1u8 && board.r7.c1 <= 9u8) &&
            (board.r7.c2 >= 1u8 && board.r7.c2 <= 9u8) &&
            (board.r7.c3 >= 1u8 && board.r7.c3 <= 9u8) &&
            (board.r7.c4 >= 1u8 && board.r7.c4 <= 9u8) &&
            (board.r7.c5 >= 1u8 && board.r7.c5 <= 9u8) &&
            (board.r7.c6 >= 1u8 && board.r7.c6 <= 9u8) &&
            (board.r7.c7 >= 1u8 && board.r7.c7 <= 9u8) &&
            (board.r7.c8 >= 1u8 && board.r7.c8 <= 9u8) &&
            (board.r7.c9 >= 1u8 && board.r7.c9 <= 9u8) &&
            (board.r8.c1 >= 1u8 && board.r8.c1 <= 9u8) &&
            (board.r8.c2 >= 1u8 && board.r8.c2 <= 9u8) &&
            (board.r8.c3 >= 1u8 && board.r8.c3 <= 9u8) &&
            (board.r8.c4 >= 1u8 && board.r8.c4 <= 9u8) &&
            (board.r8.c5 >= 1u8 && board.r8.c5 <= 9u8) &&
            (board.r8.c6 >= 1u8 && board.r8.c6 <= 9u8) &&
            (board.r8.c7 >= 1u8 && board.r8.c7 <= 9u8) &&
            (board.r8.c8 >= 1u8 && board.r8.c8 <= 9u8) &&
            (board.r8.c9 >= 1u8 && board.r8.c9 <= 9u8) &&
            (board.r9.c1 >= 1u8 && board.r9.c1 <= 9u8) &&
            (board.r9.c2 >= 1u8 && board.r9.c2 <= 9u8) &&
            (board.r9.c3 >= 1u8 && board.r9.c3 <= 9u8) &&
            (board.r9.c4 >= 1u8 && board.r9.c4 <= 9u8) &&
            (board.r9.c5 >= 1u8 && board.r9.c5 <= 9u8) &&
            (board.r9.c6 >= 1u8 && board.r9.c6 <= 9u8) &&
            (board.r9.c7 >= 1u8 && board.r9.c7 <= 9u8) &&
            (board.r9.c8 >= 1u8 && board.r9.c8 <= 9u8) &&
            (board.r9.c9 >= 1u8 && board.r9.c9 <= 9u8);
    }

    // Check that each row contains 1-9 without repetition
    function 





















}
