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
    function check_rows (board: Board) -> bool {
        return (
            (board.r1.c1 != board.r1.c2 && board.r1.c1 != board.r1.c3 && board.r1.c1 != board.r1.c4 && board.r1.c1 != board.r1.c5 && board.r1.c1 != board.r1.c6 && board.r1.c1 != board.r1.c7 && board.r1.c1 != board.r1.c8 && board.r1.c1 != board.r1.c9) &&
            (board.r1.c2 != board.r1.c3 && board.r1.c2 != board.r1.c4 && board.r1.c2 != board.r1.c5 && board.r1.c2 != board.r1.c6 && board.r1.c2 != board.r1.c7 && board.r1.c2 != board.r1.c8 && board.r1.c2 != board.r1.c9) &&
            (board.r1.c3 != board.r1.c4 && board.r1.c3 != board.r1.c5 && board.r1.c3 != board.r1.c6 && board.r1.c3 != board.r1.c7 && board.r1.c3 != board.r1.c8 && board.r1.c3 != board.r1.c9) &&
            (board.r1.c4 != board.r1.c5 && board.r1.c4 != board.r1.c6 && board.r1.c4 != board.r1.c7 && board.r1.c4 != board.r1.c8 && board.r1.c4 != board.r1.c9) &&
            (board.r1.c5 != board.r1.c6 && board.r1.c5 != board.r1.c7 && board.r1.c5 != board.r1.c8 && board.r1.c5 != board.r1.c9) &&
            (board.r1.c6 != board.r1.c7 && board.r1.c6 != board.r1.c8 && board.r1.c6 != board.r1.c9) &&
            (board.r1.c7 != board.r1.c8 && board.r1.c7 != board.r1.c9) &&
            (board.r1.c8 != board.r1.c9) &&
            (board.r2.c1 != board.r2.c2 && board.r2.c1 != board.r2.c3 && board.r2.c1 != board.r2.c4 && board.r2.c1 != board.r2.c5 && board.r2.c1 != board.r2.c6 && board.r2.c1 != board.r2.c7 && board.r2.c1 != board.r2.c8 && board.r2.c1 != board.r2.c9) &&
            (board.r2.c2 != board.r2.c3 && board.r2.c2 != board.r2.c4 && board.r2.c2 != board.r2.c5 && board.r2.c2 != board.r2.c6 && board.r2.c2 != board.r2.c7 && board.r2.c2 != board.r2.c8 && board.r2.c2 != board.r2.c9) &&
            (board.r2.c3 != board.r2.c4 && board.r2.c3 != board.r2.c5 && board.r2.c3 != board.r2.c6 && board.r2.c3 != board.r2.c7 && board.r2.c3 != board.r2.c8 && board.r2.c3 != board.r2.c9) &&
            (board.r2.c4 != board.r2.c5 && board.r2.c4 != board.r2.c6 && board.r2.c4 != board.r2.c7 && board.r2.c4 != board.r2.c8 && board.r2.c4 != board.r2.c9) &&
            (board.r2.c5 != board.r2.c6 && board.r2.c5 != board.r2.c7 && board.r2.c5 != board.r2.c8 && board.r2.c5 != board.r2.c9) &&
            (board.r2.c6 != board.r2.c7 && board.r2.c6 != board.r2.c8 && board.r2.c6 != board.r2.c9) &&
            (board.r2.c7 != board.r2.c8 && board.r2.c7 != board.r2.c9) &&
            (board.r2.c8 != board.r2.c9) &&
            (board.r3.c1 != board.r3.c2 && board.r3.c1 != board.r3.c3 && board.r3.c1 != board.r3.c4 && board.r3.c1 != board.r3.c5 && board.r3.c1 != board.r3.c6 && board.r3.c1 != board.r3.c7 && board.r3.c1 != board.r3.c8 && board.r3.c1 != board.r3.c9) &&
            (board.r3.c2 != board.r3.c3 && board.r3.c2 != board.r3.c4 && board.r3.c2 != board.r3.c5 && board.r3.c2 != board.r3.c6 && board.r3.c2 != board.r3.c7 && board.r3.c2 != board.r3.c8 && board.r3.c2 != board.r3.c9) &&
            (board.r3.c3 != board.r3.c4 && board.r3.c3 != board.r3.c5 && board.r3.c3 != board.r3.c6 && board.r3.c3 != board.r3.c7 && board.r3.c3 != board.r3.c8 && board.r3.c3 != board.r3.c9) &&
            (board.r3.c4 != board.r3.c5 && board.r3.c4 != board.r3.c6 && board.r3.c4 != board.r3.c7 && board.r3.c4 != board.r3.c8 && board.r3.c4 != board.r3.c9) &&
            (board.r3.c5 != board.r3.c6 && board.r3.c5 != board.r3.c7 && board.r3.c5 != board.r3.c8 && board.r3.c5 != board.r3.c9) &&
            (board.r3.c6 != board.r3.c7 && board.r3.c6 != board.r3.c8 && board.r3.c6 != board.r3.c9) &&
            (board.r3.c7 != board.r3.c8 && board.r3.c7 != board.r3.c9) &&
            (board.r3.c8 != board.r3.c9) &&
            (board.r4.c1 != board.r4.c2 && board.r4.c1 != board.r4.c3 && board.r4.c1 != board.r4.c4 && board.r4.c1 != board.r4.c5 && board.r4.c1 != board.r4.c6 && board.r4.c1 != board.r4.c7 && board.r4.c1 != board.r4.c8 && board.r4.c1 != board.r4.c9) &&
            (board.r4.c2 != board.r4.c3 && board.r4.c2 != board.r4.c4 && board.r4.c2 != board.r4.c5 && board.r4.c2 != board.r4.c6 && board.r4.c2 != board.r4.c7 && board.r4.c2 != board.r4.c8 && board.r4.c2 != board.r4.c9) &&
            (board.r4.c3 != board.r4.c4 && board.r4.c3 != board.r4.c5 && board.r4.c3 != board.r4.c6 && board.r4.c3 != board.r4.c7 && board.r4.c3 != board.r4.c8 && board.r4.c3 != board.r4.c9) &&
            (board.r4.c4 != board.r4.c5 && board.r4.c4 != board.r4.c6 && board.r4.c4 != board.r4.c7 && board.r4.c4 != board.r4.c8 && board.r4.c4 != board.r4.c9) &&
            (board.r4.c5 != board.r4.c6 && board.r4.c5 != board.r4.c7 && board.r4.c5 != board.r4.c8 && board.r4.c5 != board.r4.c9) &&
            (board.r4.c6 != board.r4.c7 && board.r4.c6 != board.r4.c8 && board.r4.c6 != board.r4.c9) &&
            (board.r4.c7 != board.r4.c8 && board.r4.c7 != board.r4.c9) &&
            (board.r4.c8 != board.r4.c9) &&
            (board.r5.c1 != board.r5.c2 && board.r5.c1 != board.r5.c3 && board.r5.c1 != board.r5.c4 && board.r5.c1 != board.r5.c5 && board.r5.c1 != board.r5.c6 && board.r5.c1 != board.r5.c7 && board.r5.c1 != board.r5.c8 && board.r5.c1 != board.r5.c9) &&
            (board.r5.c2 != board.r5.c3 && board.r5.c2 != board.r5.c4 && board.r5.c2 != board.r5.c5 && board.r5.c2 != board.r5.c6 && board.r5.c2 != board.r5.c7 && board.r5.c2 != board.r5.c8 && board.r5.c2 != board.r5.c9) &&
            (board.r5.c3 != board.r5.c4 && board.r5.c3 != board.r5.c5 && board.r5.c3 != board.r5.c6 && board.r5.c3 != board.r5.c7 && board.r5.c3 != board.r5.c8 && board.r5.c3 != board.r5.c9) &&
            (board.r5.c4 != board.r5.c5 && board.r5.c4 != board.r5.c6 && board.r5.c4 != board.r5.c7 && board.r5.c4 != board.r5.c8 && board.r5.c4 != board.r5.c9) &&
            (board.r5.c5 != board.r5.c6 && board.r5.c5 != board.r5.c7 && board.r5.c5 != board.r5.c8 && board.r5.c5 != board.r5.c9) &&
            (board.r5.c6 != board.r5.c7 && board.r5.c6 != board.r5.c8 && board.r5.c6 != board.r5.c9) &&
            (board.r5.c7 != board.r5.c8 && board.r5.c7 != board.r5.c9) &&
            (board.r5.c8 != board.r5.c9) &&
            (board.r6.c1 != board.r6.c2 && board.r6.c1 != board.r6.c3 && board.r6.c1 != board.r6.c4 && board.r6.c1 != board.r6.c5 && board.r6.c1 != board.r6.c6 && board.r6.c1 != board.r6.c7 && board.r6.c1 != board.r6.c8 && board.r6.c1 != board.r6.c9) &&
            (board.r6.c2 != board.r6.c3 && board.r6.c2 != board.r6.c4 && board.r6.c2 != board.r6.c5 && board.r6.c2 != board.r6.c6 && board.r6.c2 != board.r6.c7 && board.r6.c2 != board.r6.c8 && board.r6.c2 != board.r6.c9) &&
            (board.r6.c3 != board.r6.c4 && board.r6.c3 != board.r6.c5 && board.r6.c3 != board.r6.c6 && board.r6.c3 != board.r6.c7 && board.r6.c3 != board.r6.c8 && board.r6.c3 != board.r6.c9) &&
            (board.r6.c4 != board.r6.c5 && board.r6.c4 != board.r6.c6 && board.r6.c4 != board.r6.c7 && board.r6.c4 != board.r6.c8 && board.r6.c4 != board.r6.c9) &&
            (board.r6.c5 != board.r6.c6 && board.r6.c5 != board.r6.c7 && board.r6.c5 != board.r6.c8 && board.r6.c5 != board.r6.c9) &&
            (board.r6.c6 != board.r6.c7 && board.r6.c6 != board.r6.c8 && board.r6.c6 != board.r6.c9) &&
            (board.r6.c7 != board.r6.c8 && board.r6.c7 != board.r6.c9) &&
            (board.r6.c8 != board.r6.c9) &&
            (board.r7.c1 != board.r7.c2 && board.r7.c1 != board.r7.c3 && board.r7.c1 != board.r7.c4 && board.r7.c1 != board.r7.c5 && board.r7.c1 != board.r7.c6 && board.r7.c1 != board.r7.c7 && board.r7.c1 != board.r7.c8 && board.r7.c1 != board.r7.c9) &&
            (board.r7.c2 != board.r7.c3 && board.r7.c2 != board.r7.c4 && board.r7.c2 != board.r7.c5 && board.r7.c2 != board.r7.c6 && board.r7.c2 != board.r7.c7 && board.r7.c2 != board.r7.c8 && board.r7.c2 != board.r7.c9) &&
            (board.r7.c3 != board.r7.c4 && board.r7.c3 != board.r7.c5 && board.r7.c3 != board.r7.c6 && board.r7.c3 != board.r7.c7 && board.r7.c3 != board.r7.c8 && board.r7.c3 != board.r7.c9) &&
            (board.r7.c4 != board.r7.c5 && board.r7.c4 != board.r7.c6 && board.r7.c4 != board.r7.c7 && board.r7.c4 != board.r7.c8 && board.r7.c4 != board.r7.c9) &&
            (board.r7.c5 != board.r7.c6 && board.r7.c5 != board.r7.c7 && board.r7.c5 != board.r7.c8 && board.r7.c5 != board.r7.c9) &&
            (board.r7.c6 != board.r7.c7 && board.r7.c6 != board.r7.c8 && board.r7.c6 != board.r7.c9) &&
            (board.r7.c7 != board.r7.c8 && board.r7.c7 != board.r7.c9) &&
            (board.r7.c8 != board.r7.c9) &&
            (board.r8.c1 != board.r8.c2 && board.r8.c1 != board.r8.c3 && board.r8.c1 != board.r8.c4 && board.r8.c1 != board.r8.c5 && board.r8.c1 != board.r8.c6 && board.r8.c1 != board.r8.c7 && board.r8.c1 != board.r8.c8 && board.r8.c1 != board.r8.c9) &&
            (board.r8.c2 != board.r8.c3 && board.r8.c2 != board.r8.c4 && board.r8.c2 != board.r8.c5 && board.r8.c2 != board.r8.c6 && board.r8.c2 != board.r8.c7 && board.r8.c2 != board.r8.c8 && board.r8.c2 != board.r8.c9) &&
            (board.r8.c3 != board.r8.c4 && board.r8.c3 != board.r8.c5 && board.r8.c3 != board.r8.c6 && board.r8.c3 != board.r8.c7 && board.r8.c3 != board.r8.c8 && board.r8.c3 != board.r8.c9) &&
            (board.r8.c4 != board.r8.c5 && board.r8.c4 != board.r8.c6 && board.r8.c4 != board.r8.c7 && board.r8.c4 != board.r8.c8 && board.r8.c4 != board.r8.c9) &&
            (board.r8.c5 != board.r8.c6 && board.r8.c5 != board.r8.c7 && board.r8.c5 != board.r8.c8 && board.r8.c5 != board.r8.c9) &&
            (board.r8.c6 != board.r8.c7 && board.r8.c6 != board.r8.c8 && board.r8.c6 != board.r8.c9) &&
            (board.r8.c7 != board.r8.c8 && board.r8.c7 != board.r8.c9) &&
            (board.r8.c8 != board.r8.c9) &&
            (board.r9.c1 != board.r9.c2 && board.r9.c1 != board.r9.c3 && board.r9.c1 != board.r9.c4 && board.r9.c1 != board.r9.c5 && board.r9.c1 != board.r9.c6 && board.r9.c1 != board.r9.c7 && board.r9.c1 != board.r9.c8 && board.r9.c1 != board.r9.c9) &&
            (board.r9.c2 != board.r9.c3 && board.r9.c2 != board.r9.c4 && board.r9.c2 != board.r9.c5 && board.r9.c2 != board.r9.c6 && board.r9.c2 != board.r9.c7 && board.r9.c2 != board.r9.c8 && board.r9.c2 != board.r9.c9) &&
            (board.r9.c3 != board.r9.c4 && board.r9.c3 != board.r9.c5 && board.r9.c3 != board.r9.c6 && board.r9.c3 != board.r9.c7 && board.r9.c3 != board.r9.c8 && board.r9.c3 != board.r9.c9) &&
            (board.r9.c4 != board.r9.c5 && board.r9.c4 != board.r9.c6 && board.r9.c4 != board.r9.c7 && board.r9.c4 != board.r9.c8 && board.r9.c4 != board.r9.c9) &&
            (board.r9.c5 != board.r9.c6 && board.r9.c5 != board.r9.c7 && board.r9.c5 != board.r9.c8 && board.r9.c5 != board.r9.c9) &&
            (board.r9.c6 != board.r9.c7 && board.r9.c6 != board.r9.c8 && board.r9.c6 != board.r9.c9) &&
            (board.r9.c7 != board.r9.c8 && board.r9.c7 != board.r9.c9) &&
            (board.r9.c8 != board.r9.c9) 

        );
    } 

    // Check that each column contains the numbers 1-9 exactly once
    function check_columns(board: Board) -> bool {
        return (
            (board.r1.c1 != board.r2.c1 && board.r1.c1 != board.r3.c1 && board.r1.c1 != board.r4.c1 && board.r1.c1 != board.r5.c1 && board.r1.c1 != board.r6.c1 && board.r1.c1 != board.r7.c1 && board.r1.c1 != board.r8.c1 && board.r1.c1 != board.r9.c1) &&
            (board.r2.c1 != board.r3.c1 && board.r2.c1 != board.r4.c1 && board.r2.c1 != board.r5.c1 && board.r2.c1 != board.r6.c1 && board.r2.c1 != board.r7.c1 && board.r2.c1 != board.r8.c1 && board.r2.c1 != board.r9.c1) &&
            (board.r3.c1 != board.r4.c1 && board.r3.c1 != board.r5.c1 && board.r3.c1 != board.r6.c1 && board.r3.c1 != board.r7.c1 && board.r3.c1 != board.r8.c1 && board.r3.c1 != board.r9.c1) &&
            (board.r4.c1 != board.r5.c1 && board.r4.c1 != board.r6.c1 && board.r4.c1 != board.r7.c1 && board.r4.c1 != board.r8.c1 && board.r4.c1 != board.r9.c1) &&
            (board.r5.c1 != board.r6.c1 && board.r5.c1 != board.r7.c1 && board.r5.c1 != board.r8.c1 && board.r5.c1 != board.r9.c1) &&
            (board.r6.c1 != board.r7.c1 && board.r6.c1 != board.r8.c1 && board.r6.c1 != board.r9.c1) &&
            (board.r7.c1 != board.r8.c1 && board.r7.c1 != board.r9.c1) &&
            (board.r8.c1 != board.r9.c1) &&
            (board.r1.c2 != board.r2.c2 && board.r1.c2 != board.r3.c2 && board.r1.c2 != board.r4.c2 && board.r1.c2 != board.r5.c2 && board.r1.c2 != board.r6.c2 && board.r1.c2 != board.r7.c2 && board.r1.c2 != board.r8.c2 && board.r1.c2 != board.r9.c2) &&
            (board.r2.c2 != board.r3.c2 && board.r2.c2 != board.r4.c2 && board.r2.c2 != board.r5.c2 && board.r2.c2 != board.r6.c2 && board.r2.c2 != board.r7.c2 && board.r2.c2 != board.r8.c2 && board.r2.c2 != board.r9.c2) &&
            (board.r3.c2 != board.r4.c2 && board.r3.c2 != board.r5.c2 && board.r3.c2 != board.r6.c2 && board.r3.c2 != board.r7.c2 && board.r3.c2 != board.r8.c2 && board.r3.c2 != board.r9.c2) &&
            (board.r4.c2 != board.r5.c2 && board.r4.c2 != board.r6.c2 && board.r4.c2 != board.r7.c2 && board.r4.c2 != board.r8.c2 && board.r4.c2 != board.r9.c2) &&
            (board.r5.c2 != board.r6.c2 && board.r5.c2 != board.r7.c2 && board.r5.c2 != board.r8.c2 && board.r5.c2 != board.r9.c2) &&
            (board.r6.c2 != board.r7.c2 && board.r6.c2 != board.r8.c2 && board.r6.c2 != board.r9.c2) &&
            (board.r7.c2 != board.r8.c2 && board.r7.c2 != board.r9.c2) &&
            (board.r8.c2 != board.r9.c2) &&
            (board.r1.c3 != board.r2.c3 && board.r1.c3 != board.r3.c3 && board.r1.c3 != board.r4.c3 && board.r1.c3 != board.r5.c3 && board.r1.c3 != board.r6.c3 && board.r1.c3 != board.r7.c3 && board.r1.c3 != board.r8.c3 && board.r1.c3 != board.r9.c3) &&
            (board.r2.c3 != board.r3.c3 && board.r2.c3 != board.r4.c3 && board.r2.c3 != board.r5.c3 && board.r2.c3 != board.r6.c3 && board.r2.c3 != board.r7.c3 && board.r2.c3 != board.r8.c3 && board.r2.c3 != board.r9.c3) &&
            (board.r3.c3 != board.r4.c3 && board.r3.c3 != board.r5.c3 && board.r3.c3 != board.r6.c3 && board.r3.c3 != board.r7.c3 && board.r3.c3 != board.r8.c3 && board.r3.c3 != board.r9.c3) &&
            (board.r4.c3 != board.r5.c3 && board.r4.c3 != board.r6.c3 && board.r4.c3 != board.r7.c3 && board.r4.c3 != board.r8.c3 && board.r4.c3 != board.r9.c3) &&
            (board.r5.c3 != board.r6.c3 && board.r5.c3 != board.r7.c3 && board.r5.c3 != board.r8.c3 && board.r5.c3 != board.r9.c3) &&
            (board.r6.c3 != board.r7.c3 && board.r6.c3 != board.r8.c3 && board.r6.c3 != board.r9.c3) &&
            (board.r7.c3 != board.r8.c3 && board.r7.c3 != board.r9.c3) &&
            (board.r8.c3 != board.r9.c3) &&
            (board.r1.c4 != board.r2.c4 && board.r1.c4 != board.r3.c4 && board.r1.c4 != board.r4.c4 && board.r1.c4 != board.r5.c4 && board.r1.c4 != board.r6.c4 && board.r1.c4 != board.r7.c4 && board.r1.c4 != board.r8.c4 && board.r1.c4 != board.r9.c4) &&
            (board.r2.c4 != board.r3.c4 && board.r2.c4 != board.r4.c4 && board.r2.c4 != board.r5.c4 && board.r2.c4 != board.r6.c4 && board.r2.c4 != board.r7.c4 && board.r2.c4 != board.r8.c4 && board.r2.c4 != board.r9.c4) &&
            (board.r3.c4 != board.r4.c4 && board.r3.c4 != board.r5.c4 && board.r3.c4 != board.r6.c4 && board.r3.c4 != board.r7.c4 && board.r3.c4 != board.r8.c4 && board.r3.c4 != board.r9.c4) &&
            (board.r4.c4 != board.r5.c4 && board.r4.c4 != board.r6.c4 && board.r4.c4 != board.r7.c4 && board.r4.c4 != board.r8.c4 && board.r4.c4 != board.r9.c4) &&
            (board.r5.c4 != board.r6.c4 && board.r5.c4 != board.r7.c4 && board.r5.c4 != board.r8.c4 && board.r5.c4 != board.r9.c4) &&
            (board.r6.c4 != board.r7.c4 && board.r6.c4 != board.r8.c4 && board.r6.c4 != board.r9.c4) &&
            (board.r7.c4 != board.r8.c4 && board.r7.c4 != board.r9.c4) &&
            (board.r8.c4 != board.r9.c4) &&
            (board.r1.c5 != board.r2.c5 && board.r1.c5 != board.r3.c5 && board.r1.c5 != board.r4.c5 && board.r1.c5 != board.r5.c5 && board.r1.c5 != board.r6.c5 && board.r1.c5 != board.r7.c5 && board.r1.c5 != board.r8.c5 && board.r1.c5 != board.r9.c5) &&
            (board.r2.c5 != board.r3.c5 && board.r2.c5 != board.r4.c5 && board.r2.c5 != board.r5.c5 && board.r2.c5 != board.r6.c5 && board.r2.c5 != board.r7.c5 && board.r2.c5 != board.r8.c5 && board.r2.c5 != board.r9.c5) &&
            (board.r3.c5 != board.r4.c5 && board.r3.c5 != board.r5.c5 && board.r3.c5 != board.r6.c5 && board.r3.c5 != board.r7.c5 && board.r3.c5 != board.r8.c5 && board.r3.c5 != board.r9.c5) &&
            (board.r4.c5 != board.r5.c5 && board.r4.c5 != board.r6.c5 && board.r4.c5 != board.r7.c5 && board.r4.c5 != board.r8.c5 && board.r4.c5 != board.r9.c5) &&
            (board.r5.c5 != board.r6.c5 && board.r5.c5 != board.r7.c5 && board.r5.c5 != board.r8.c5 && board.r5.c5 != board.r9.c5) &&
            (board.r6.c5 != board.r7.c5 && board.r6.c5 != board.r8.c5 && board.r6.c5 != board.r9.c5) &&
            (board.r7.c5 != board.r8.c5 && board.r7.c5 != board.r9.c5) &&
            (board.r8.c5 != board.r9.c5) &&
            (board.r1.c6 != board.r2.c6 && board.r1.c6 != board.r3.c6 && board.r1.c6 != board.r4.c6 && board.r1.c6 != board.r5.c6 && board.r1.c6 != board.r6.c6 && board.r1.c6 != board.r7.c6 && board.r1.c6 != board.r8.c6 && board.r1.c6 != board.r9.c6) &&
            (board.r2.c6 != board.r3.c6 && board.r2.c6 != board.r4.c6 && board.r2.c6 != board.r5.c6 && board.r2.c6 != board.r6.c6 && board.r2.c6 != board.r7.c6 && board.r2.c6 != board.r8.c6 && board.r2.c6 != board.r9.c6) &&
            (board.r3.c6 != board.r4.c6 && board.r3.c6 != board.r5.c6 && board.r3.c6 != board.r6.c6 && board.r3.c6 != board.r7.c6 && board.r3.c6 != board.r8.c6 && board.r3.c6 != board.r9.c6) &&
            (board.r4.c6 != board.r5.c6 && board.r4.c6 != board.r6.c6 && board.r4.c6 != board.r7.c6 && board.r4.c6 != board.r8.c6 && board.r4.c6 != board.r9.c6) &&
            (board.r5.c6 != board.r6.c6 && board.r5.c6 != board.r7.c6 && board.r5.c6 != board.r8.c6 && board.r5.c6 != board.r9.c6) &&
            (board.r6.c6 != board.r7.c6 && board.r6.c6 != board.r8.c6 && board.r6.c6 != board.r9.c6) &&
            (board.r7.c6 != board.r8.c6 && board.r7.c6 != board.r9.c6) &&
            (board.r8.c6 != board.r9.c6) &&
            (board.r1.c7 != board.r2.c7 && board.r1.c7 != board.r3.c7 && board.r1.c7 != board.r4.c7 && board.r1.c7 != board.r5.c7 && board.r1.c7 != board.r6.c7 && board.r1.c7 != board.r7.c7 && board.r1.c7 != board.r8.c7 && board.r1.c7 != board.r9.c7) &&
            (board.r2.c7 != board.r3.c7 && board.r2.c7 != board.r4.c7 && board.r2.c7 != board.r5.c7 && board.r2.c7 != board.r6.c7 && board.r2.c7 != board.r7.c7 && board.r2.c7 != board.r8.c7 && board.r2.c7 != board.r9.c7) &&
            (board.r3.c7 != board.r4.c7 && board.r3.c7 != board.r5.c7 && board.r3.c7 != board.r6.c7 && board.r3.c7 != board.r7.c7 && board.r3.c7 != board.r8.c7 && board.r3.c7 != board.r9.c7) &&
            (board.r4.c7 != board.r5.c7 && board.r4.c7 != board.r6.c7 && board.r4.c7 != board.r7.c7 && board.r4.c7 != board.r8.c7 && board.r4.c7 != board.r9.c7) &&
            (board.r5.c7 != board.r6.c7 && board.r5.c7 != board.r7.c7 && board.r5.c7 != board.r8.c7 && board.r5.c7 != board.r9.c7) &&
            (board.r6.c7 != board.r7.c7 && board.r6.c7 != board.r8.c7 && board.r6.c7 != board.r9.c7) &&
            (board.r7.c7 != board.r8.c7 && board.r7.c7 != board.r9.c7) &&
            (board.r8.c7 != board.r9.c7) &&
            (board.r1.c8 != board.r2.c8 && board.r1.c8 != board.r3.c8 && board.r1.c8 != board.r4.c8 && board.r1.c8 != board.r5.c8 && board.r1.c8 != board.r6.c8 && board.r1.c8 != board.r7.c8 && board.r1.c8 != board.r8.c8 && board.r1.c8 != board.r9.c8) &&
            (board.r2.c8 != board.r3.c8 && board.r2.c8 != board.r4.c8 && board.r2.c8 != board.r5.c8 && board.r2.c8 != board.r6.c8 && board.r2.c8 != board.r7.c8 && board.r2.c8 != board.r8.c8 && board.r2.c8 != board.r9.c8) &&
            (board.r3.c8 != board.r4.c8 && board.r3.c8 != board.r5.c8 && board.r3.c8 != board.r6.c8 && board.r3.c8 != board.r7.c8 && board.r3.c8 != board.r8.c8 && board.r3.c8 != board.r9.c8) &&
            (board.r4.c8 != board.r5.c8 && board.r4.c8 != board.r6.c8 && board.r4.c8 != board.r7.c8 && board.r4.c8 != board.r8.c8 && board.r4.c8 != board.r9.c8) &&
            (board.r5.c8 != board.r6.c8 && board.r5.c8 != board.r7.c8 && board.r5.c8 != board.r8.c8 && board.r5.c8 != board.r9.c8) &&
            (board.r6.c8 != board.r7.c8 && board.r6.c8 != board.r8.c8 && board.r6.c8 != board.r9.c8) &&
            (board.r7.c8 != board.r8.c8 && board.r7.c8 != board.r9.c8) &&
            (board.r8.c8 != board.r9.c8) &&
            (board.r1.c9 != board.r2.c9 && board.r1.c9 != board.r3.c9 && board.r1.c9 != board.r4.c9 && board.r1.c9 != board.r5.c9 && board.r1.c9 != board.r6.c9 && board.r1.c9 != board.r7.c9 && board.r1.c9 != board.r8.c9 && board.r1.c9 != board.r9.c9) &&
            (board.r2.c9 != board.r3.c9 && board.r2.c9 != board.r4.c9 && board.r2.c9 != board.r5.c9 && board.r2.c9 != board.r6.c9 && board.r2.c9 != board.r7.c9 && board.r2.c9 != board.r8.c9 && board.r2.c9 != board.r9.c9) &&
            (board.r3.c9 != board.r4.c9 && board.r3.c9 != board.r5.c9 && board.r3.c9 != board.r6.c9 && board.r3.c9 != board.r7.c9 && board.r3.c9 != board.r8.c9 && board.r3.c9 != board.r9.c9) &&
            (board.r4.c9 != board.r5.c9 && board.r4.c9 != board.r6.c9 && board.r4.c9 != board.r7.c9 && board.r4.c9 != board.r8.c9 && board.r4.c9 != board.r9.c9) &&
            (board.r5.c9 != board.r6.c9 && board.r5.c9 != board.r7.c9 && board.r5.c9 != board.r8.c9 && board.r5.c9 != board.r9.c9) &&
            (board.r6.c9 != board.r7.c9 && board.r6.c9 != board.r8.c9 && board.r6.c9 != board.r9.c9) &&
            (board.r7.c9 != board.r8.c9 && board.r7.c9 != board.r9.c9) &&
            (board.r8.c9 != board.r9.c9)
        );


    }

    //  Check that a digit occurs only once in a nonet
    // There are 9 nonets in a Sudoku puzzle
    // Each nonet contains 9 cells
    // Each cell contains a digit
    // Each digit occurs only once in a nonet
    // This function checks that this is true
    // It returns true if the nonet is valid
    // It returns false if the nonet is invalid
    function check_nonets(board: Board) -> bool {
        return (
            (board.r1.c1 != board.r1.c2 && board.r1.c1 != board.r1.c3 && board.r1.c1 != board.r2.c1 && board.r1.c1 != board.r2.c2 && board.r1.c1 != board.r2.c3 && board.r1.c1 != board.r3.c1 && board.r1.c1 != board.r3.c2 && board.r1.c1 != board.r3.c3) &&
            (board.r1.c2 != board.r1.c3 && board.r1.c2 != board.r2.c1 && board.r1.c2 != board.r2.c2 && board.r1.c2 != board.r2.c3 && board.r1.c2 != board.r3.c1 && board.r1.c2 != board.r3.c2 && board.r1.c2 != board.r3.c3) &&
            (board.r1.c3 != board.r2.c1 && board.r1.c3 != board.r2.c2 && board.r1.c3 != board.r2.c3 && board.r1.c3 != board.r3.c1 && board.r1.c3 != board.r3.c2 && board.r1.c3 != board.r3.c3) &&
            (board.r2.c1 != board.r2.c2 && board.r2.c1 != board.r2.c3 && board.r2.c1 != board.r3.c1 && board.r2.c1 != board.r3.c2 && board.r2.c1 != board.r3.c3) &&
            (board.r2.c2 != board.r2.c3 && board.r2.c2 != board.r3.c1 && board.r2.c2 != board.r3.c2 && board.r2.c2 != board.r3.c3) &&
            (board.r2.c3 != board.r3.c1 && board.r2.c3 != board.r3.c2 && board.r2.c3 != board.r3.c3) &&
            (board.r3.c1 != board.r3.c2 && board.r3.c1 != board.r3.c3) &&
            (board.r3.c2 != board.r3.c3) &&
            (board.r1.c4 != board.r1.c5 && board.r1.c4 != board.r1.c6 && board.r1.c4 != board.r2.c4 && board.r1.c4 != board.r2.c5 && board.r1.c4 != board.r2.c6 && board.r1.c4 != board.r3.c4 && board.r1.c4 != board.r3.c5 && board.r1.c4 != board.r3.c6) &&
            (board.r1.c5 != board.r1.c6 && board.r1.c5 != board.r2.c4 && board.r1.c5 != board.r2.c5 && board.r1.c5 != board.r2.c6 && board.r1.c5 != board.r3.c4 && board.r1.c5 != board.r3.c5 && board.r1.c5 != board.r3.c6) &&
            (board.r1.c6 != board.r2.c4 && board.r1.c6 != board.r2.c5 && board.r1.c6 != board.r2.c6 && board.r1.c6 != board.r3.c4 && board.r1.c6 != board.r3.c5 && board.r1.c6 != board.r3.c6) &&
            (board.r2.c4 != board.r2.c5 && board.r2.c4 != board.r2.c6 && board.r2.c4 != board.r3.c4 && board.r2.c4 != board.r3.c5 && board.r2.c4 != board.r3.c6) &&
            (board.r2.c5 != board.r2.c6 && board.r2.c5 != board.r3.c4 && board.r2.c5 != board.r3.c5 && board.r2.c5 != board.r3.c6) &&
            (board.r2.c6 != board.r3.c4 && board.r2.c6 != board.r3.c5 && board.r2.c6 != board.r3.c6) &&
            (board.r3.c4 != board.r3.c5 && board.r3.c4 != board.r3.c6) &&
            (board.r3.c5 != board.r3.c6) &&
            (board.r1.c7 != board.r1.c8 && board.r1.c7 != board.r1.c9 && board.r1.c7 != board.r2.c7 && board.r1.c7 != board.r2.c8 && board.r1.c7 != board.r2.c9 && board.r1.c7 != board.r3.c7 && board.r1.c7 != board.r3.c8 && board.r1.c7 != board.r3.c9) &&
            (board.r1.c8 != board.r1.c9 && board.r1.c8 != board.r2.c7 && board.r1.c8 != board.r2.c8 && board.r1.c8 != board.r2.c9 && board.r1.c8 != board.r3.c7 && board.r1.c8 != board.r3.c8 && board.r1.c8 != board.r3.c9) &&
            (board.r1.c9 != board.r2.c7 && board.r1.c9 != board.r2.c8 && board.r1.c9 != board.r2.c9 && board.r1.c9 != board.r3.c7 && board.r1.c9 != board.r3.c8 && board.r1.c9 != board.r3.c9) &&
            (board.r2.c7 != board.r2.c8 && board.r2.c7 != board.r2.c9 && board.r2.c7 != board.r3.c7 && board.r2.c7 != board.r3.c8 && board.r2.c7 != board.r3.c9) &&
            (board.r2.c8 != board.r2.c9 && board.r2.c8 != board.r3.c7 && board.r2.c8 != board.r3.c8 && board.r2.c8 != board.r3.c9) &&
            (board.r2.c9 != board.r3.c7 && board.r2.c9 != board.r3.c8 && board.r2.c9 != board.r3.c9) &&
            (board.r3.c7 != board.r3.c8 && board.r3.c7 != board.r3.c9) &&
            (board.r3.c8 != board.r3.c9) &&
            (board.r4.c1 != board.r4.c2 && board.r4.c1 != board.r4.c3 && board.r4.c1 != board.r5.c1 && board.r4.c1 != board.r5.c2 && board.r4.c1 != board.r5.c3 && board.r4.c1 != board.r6.c1 && board.r4.c1 != board.r6.c2 && board.r4.c1 != board.r6.c3) &&
            (board.r4.c2 != board.r4.c3 && board.r4.c2 != board.r5.c1 && board.r4.c2 != board.r5.c2 && board.r4.c2 != board.r5.c3 && board.r4.c2 != board.r6.c1 && board.r4.c2 != board.r6.c2 && board.r4.c2 != board.r6.c3) &&
            (board.r4.c3 != board.r5.c1 && board.r4.c3 != board.r5.c2 && board.r4.c3 != board.r5.c3 && board.r4.c3 != board.r6.c1 && board.r4.c3 != board.r6.c2 && board.r4.c3 != board.r6.c3) &&
            (board.r5.c1 != board.r5.c2 && board.r5.c1 != board.r5.c3 && board.r5.c1 != board.r6.c1 && board.r5.c1 != board.r6.c2 && board.r5.c1 != board.r6.c3) &&
            (board.r5.c2 != board.r5.c3 && board.r5.c2 != board.r6.c1 && board.r5.c2 != board.r6.c2 && board.r5.c2 != board.r6.c3) &&
            (board.r5.c3 != board.r6.c1 && board.r5.c3 != board.r6.c2 && board.r5.c3 != board.r6.c3) &&
            (board.r6.c1 != board.r6.c2 && board.r6.c1 != board.r6.c3) &&
            (board.r6.c2 != board.r6.c3) &&
            (board.r4.c4 != board.r4.c5 && board.r4.c4 != board.r4.c6 && board.r4.c4 != board.r5.c4 && board.r4.c4 != board.r5.c5 && board.r4.c4 != board.r5.c6 && board.r4.c4 != board.r6.c4 && board.r4.c4 != board.r6.c5 && board.r4.c4 != board.r6.c6) &&
            (board.r4.c5 != board.r4.c6 && board.r4.c5 != board.r5.c4 && board.r4.c5 != board.r5.c5 && board.r4.c5 != board.r5.c6 && board.r4.c5 != board.r6.c4 && board.r4.c5 != board.r6.c5 && board.r4.c5 != board.r6.c6) &&
            (board.r4.c6 != board.r5.c4 && board.r4.c6 != board.r5.c5 && board.r4.c6 != board.r5.c6 && board.r4.c6 != board.r6.c4 && board.r4.c6 != board.r6.c5 && board.r4.c6 != board.r6.c6) &&
            (board.r5.c4 != board.r5.c5 && board.r5.c4 != board.r5.c6 && board.r5.c4 != board.r6.c4 && board.r5.c4 != board.r6.c5 && board.r5.c4 != board.r6.c6) &&
            (board.r5.c5 != board.r5.c6 && board.r5.c5 != board.r6.c4 && board.r5.c5 != board.r6.c5 && board.r5.c5 != board.r6.c6) &&
            (board.r5.c6 != board.r6.c4 && board.r5.c6 != board.r6.c5 && board.r5.c6 != board.r6.c6) &&
            (board.r6.c4 != board.r6.c5 && board.r6.c4 != board.r6.c6) &&
            (board.r6.c5 != board.r6.c6) &&
            (board.r4.c7 != board.r4.c8 && board.r4.c7 != board.r4.c9 && board.r4.c7 != board.r5.c7 && board.r4.c7 != board.r5.c8 && board.r4.c7 != board.r5.c9 && board.r4.c7 != board.r6.c7 && board.r4.c7 != board.r6.c8 && board.r4.c7 != board.r6.c9) &&
            (board.r4.c8 != board.r4.c9 && board.r4.c8 != board.r5.c7 && board.r4.c8 != board.r5.c8 && board.r4.c8 != board.r5.c9 && board.r4.c8 != board.r6.c7 && board.r4.c8 != board.r6.c8 && board.r4.c8 != board.r6.c9) &&
            (board.r4.c9 != board.r5.c7 && board.r4.c9 != board.r5.c8 && board.r4.c9 != board.r5.c9 && board.r4.c9 != board.r6.c7 && board.r4.c9 != board.r6.c8 && board.r4.c9 != board.r6.c9) &&
            (board.r5.c7 != board.r5.c8 && board.r5.c7 != board.r5.c9 && board.r5.c7 != board.r6.c7 && board.r5.c7 != board.r6.c8 && board.r5.c7 != board.r6.c9) &&
            (board.r5.c8 != board.r5.c9 && board.r5.c8 != board.r6.c7 && board.r5.c8 != board.r6.c8 && board.r5.c8 != board.r6.c9) &&
            (board.r5.c9 != board.r6.c7 && board.r5.c9 != board.r6.c8 && board.r5.c9 != board.r6.c9) &&
            (board.r6.c7 != board.r6.c8 && board.r6.c7 != board.r6.c9) &&
            (board.r6.c8 != board.r6.c9) &&
            (board.r7.c1 != board.r7.c2 && board.r7.c1 != board.r7.c3 && board.r7.c1 != board.r8.c1 && board.r7.c1 != board.r8.c2 && board.r7.c1 != board.r8.c3 && board.r7.c1 != board.r9.c1 && board.r7.c1 != board.r9.c2 && board.r7.c1 != board.r9.c3) &&
            (board.r7.c2 != board.r7.c3 && board.r7.c2 != board.r8.c1 && board.r7.c2 != board.r8.c2 && board.r7.c2 != board.r8.c3 && board.r7.c2 != board.r9.c1 && board.r7.c2 != board.r9.c2 && board.r7.c2 != board.r9.c3) &&
            (board.r7.c3 != board.r8.c1 && board.r7.c3 != board.r8.c2 && board.r7.c3 != board.r8.c3 && board.r7.c3 != board.r9.c1 && board.r7.c3 != board.r9.c2 && board.r7.c3 != board.r9.c3) &&
            (board.r8.c1 != board.r8.c2 && board.r8.c1 != board.r8.c3 && board.r8.c1 != board.r9.c1 && board.r8.c1 != board.r9.c2 && board.r8.c1 != board.r9.c3) &&
            (board.r8.c2 != board.r8.c3 && board.r8.c2 != board.r9.c1 && board.r8.c2 != board.r9.c2 && board.r8.c2 != board.r9.c3) &&
            (board.r8.c3 != board.r9.c1 && board.r8.c3 != board.r9.c2 && board.r8.c3 != board.r9.c3) &&
            (board.r9.c1 != board.r9.c2 && board.r9.c1 != board.r9.c3) &&
            (board.r9.c2 != board.r9.c3) &&
            (board.r7.c4 != board.r7.c5 && board.r7.c4 != board.r7.c6 && board.r7.c4 != board.r8.c4 && board.r7.c4 != board.r8.c5 && board.r7.c4 != board.r8.c6 && board.r7.c4 != board.r9.c4 && board.r7.c4 != board.r9.c5 && board.r7.c4 != board.r9.c6) &&
            (board.r7.c5 != board.r7.c6 && board.r7.c5 != board.r8.c4 && board.r7.c5 != board.r8.c5 && board.r7.c5 != board.r8.c6 && board.r7.c5 != board.r9.c4 && board.r7.c5 != board.r9.c5 && board.r7.c5 != board.r9.c6) &&
            (board.r7.c6 != board.r8.c4 && board.r7.c6 != board.r8.c5 && board.r7.c6 != board.r8.c6 && board.r7.c6 != board.r9.c4 && board.r7.c6 != board.r9.c5 && board.r7.c6 != board.r9.c6) &&
            (board.r8.c4 != board.r8.c5 && board.r8.c4 != board.r8.c6 && board.r8.c4 != board.r9.c4 && board.r8.c4 != board.r9.c5 && board.r8.c4 != board.r9.c6) &&
            (board.r8.c5 != board.r8.c6 && board.r8.c5 != board.r9.c4 && board.r8.c5 != board.r9.c5 && board.r8.c5 != board.r9.c6) &&
            (board.r8.c6 != board.r9.c4 && board.r8.c6 != board.r9.c5 && board.r8.c6 != board.r9.c6) &&
            (board.r9.c4 != board.r9.c5 && board.r9.c4 != board.r9.c6) &&
            (board.r9.c5 != board.r9.c6) &&
            (board.r7.c7 != board.r7.c8 && board.r7.c7 != board.r7.c9 && board.r7.c7 != board.r8.c7 && board.r7.c7 != board.r8.c8 && board.r7.c7 != board.r8.c9 && board.r7.c7 != board.r9.c7 && board.r7.c7 != board.r9.c8 && board.r7.c7 != board.r9.c9) &&
            (board.r7.c8 != board.r7.c9 && board.r7.c8 != board.r8.c7 && board.r7.c8 != board.r8.c8 && board.r7.c8 != board.r8.c9 && board.r7.c8 != board.r9.c7 && board.r7.c8 != board.r9.c8 && board.r7.c8 != board.r9.c9) &&
            (board.r7.c9 != board.r8.c7 && board.r7.c9 != board.r8.c8 && board.r7.c9 != board.r8.c9 && board.r7.c9 != board.r9.c7 && board.r7.c9 != board.r9.c8 && board.r7.c9 != board.r9.c9) &&
            (board.r8.c7 != board.r8.c8 && board.r8.c7 != board.r8.c9 && board.r8.c7 != board.r9.c7 && board.r8.c7 != board.r9.c8 && board.r8.c7 != board.r9.c9) &&
            (board.r8.c8 != board.r8.c9 && board.r8.c8 != board.r9.c7 && board.r8.c8 != board.r9.c8 && board.r8.c8 != board.r9.c9) &&
            (board.r8.c9 != board.r9.c7 && board.r8.c9 != board.r9.c8 && board.r8.c9 != board.r9.c9) &&
            (board.r9.c7 != board.r9.c8 && board.r9.c7 != board.r9.c9) &&
            (board.r9.c8 != board.r9.c9) 


            );
    }   

    // Check that the sum of every row, column and nonet is 45
    // (1+2+3+4+5+6+7+8+9 = 45)
    // returns true if the sum of every row, column and nonet is 45
    // returns false otherwise
    function check_sum (board: Board) -> bool {
        return (
            (board.r1.c1 + board.r1.c2 + board.r1.c3 + board.r1.c4 + board.r1.c5 + board.r1.c6 + board.r1.c7 + board.r1.c8 + board.r1.c9 == 45) &&
            (board.r2.c1 + board.r2.c2 + board.r2.c3 + board.r2.c4 + board.r2.c5 + board.r2.c6 + board.r2.c7 + board.r2.c8 + board.r2.c9 == 45) &&
            (board.r3.c1 + board.r3.c2 + board.r3.c3 + board.r3.c4 + board.r3.c5 + board.r3.c6 + board.r3.c7 + board.r3.c8 + board.r3.c9 == 45) &&
            (board.r4.c1 + board.r4.c2 + board.r4.c3 + board.r4.c4 + board.r4.c5 + board.r4.c6 + board.r4.c7 + board.r4.c8 + board.r4.c9 == 45) &&
            (board.r5.c1 + board.r5.c2 + board.r5.c3 + board.r5.c4 + board.r5.c5 + board.r5.c6 + board.r5.c7 + board.r5.c8 + board.r5.c9 == 45) &&
            (board.r6.c1 + board.r6.c2 + board.r6.c3 + board.r6.c4 + board.r6.c5 + board.r6.c6 + board.r6.c7 + board.r6.c8 + board.r6.c9 == 45) &&
            (board.r7.c1 + board.r7.c2 + board.r7.c3 + board.r7.c4 + board.r7.c5 + board.r7.c6 + board.r7.c7 + board.r7.c8 + board.r7.c9 == 45) &&
            (board.r8.c1 + board.r8.c2 + board.r8.c3 + board.r8.c4 + board.r8.c5 + board.r8.c6 + board.r8.c7 + board.r8.c8 + board.r8.c9 == 45) &&
            (board.r9.c1 + board.r9.c2 + board.r9.c3 + board.r9.c4 + board.r9.c5 + board.r9.c6 + board.r9.c7 + board.r9.c8 + board.r9.c9 == 45) &&
            (board.r1.c1 + board.r2.c1 + board.r3.c1 + board.r4.c1 + board.r5.c1 + board.r6.c1 + board.r7.c1 + board.r8.c1 + board.r9.c1 == 45) &&
            (board.r1.c2 + board.r2.c2 + board.r3.c2 + board.r4.c2 + board.r5.c2 + board.r6.c2 + board.r7.c2 + board.r8.c2 + board.r9.c2 == 45) &&
            (board.r1.c3 + board.r2.c3 + board.r3.c3 + board.r4.c3 + board.r5.c3 + board.r6.c3 + board.r7.c3 + board.r8.c3 + board.r9.c3 == 45) &&
            (board.r1.c4 + board.r2.c4 + board.r3.c4 + board.r4.c4 + board.r5.c4 + board.r6.c4 + board.r7.c4 + board.r8.c4 + board.r9.c4 == 45) &&
            (board.r1.c5 + board.r2.c5 + board.r3.c5 + board.r4.c5 + board.r5.c5 + board.r6.c5 + board.r7.c5 + board.r8.c5 + board.r9.c5 == 45) &&
            (board.r1.c6 + board.r2.c6 + board.r3.c6 + board.r4.c6 + board.r5.c6 + board.r6.c6 + board.r7.c6 + board.r8.c6 + board.r9.c6 == 45) &&
            (board.r1.c7 + board.r2.c7 + board.r3.c7 + board.r4.c7 + board.r5.c7 + board.r6.c7 + board.r7.c7 + board.r8.c7 + board.r9.c7 == 45) &&
            (board.r1.c8 + board.r2.c8 + board.r3.c8 + board.r4.c8 + board.r5.c8 + board.r6.c8 + board.r7.c8 + board.r8.c8 + board.r9.c8 == 45) &&
            (board.r1.c9 + board.r2.c9 + board.r3.c9 + board.r4.c9 + board.r5.c9 + board.r6.c9 + board.r7.c9 + board.r8.c9 + board.r9.c9 == 45) &&
            (board.r1.c1 + board.r1.c2 + board.r1.c3 + board.r2.c1 + board.r2.c2 + board.r2.c3 + board.r3.c1 + board.r3.c2 + board.r3.c3 == 45) &&
            (board.r1.c4 + board.r1.c5 + board.r1.c6 + board.r2.c4 + board.r2.c5 + board.r2.c6 + board.r3.c4 + board.r3.c5 + board.r3.c6 == 45) &&
            (board.r1.c7 + board.r1.c8 + board.r1.c9 + board.r2.c7 + board.r2.c8 + board.r2.c9 + board.r3.c7 + board.r3.c8 + board.r3.c9 == 45) &&
            (board.r4.c1 + board.r4.c2 + board.r4.c3 + board.r5.c1 + board.r5.c2 + board.r5.c3 + board.r6.c1 + board.r6.c2 + board.r6.c3 == 45) &&
            (board.r4.c4 + board.r4.c5 + board.r4.c6 + board.r5.c4 + board.r5.c5 + board.r5.c6 + board.r6.c4 + board.r6.c5 + board.r6.c6 == 45) &&
            (board.r4.c7 + board.r4.c8 + board.r4.c9 + board.r5.c7 + board.r5.c8 + board.r5.c9 + board.r6.c7 + board.r6.c8 + board.r6.c9 == 45) &&
            (board.r7.c1 + board.r7.c2 + board.r7.c3 + board.r8.c1 + board.r8.c2 + board.r8.c3 + board.r9.c1 + board.r9.c2 + board.r9.c3 == 45) &&
            (board.r7.c4 + board.r7.c5 + board.r7.c6 + board.r8.c4 + board.r8.c5 + board.r8.c6 + board.r9.c4 + board.r9.c5 + board.r9.c6 == 45) &&
            (board.r7.c7 + board.r7.c8 + board.r7.c9 + board.r8.c7 + board.r8.c8 + board.r8.c9 + board.r9.c7 + board.r9.c8 + board.r9.c9 == 45) 
            



        );
    }

    // Check for a valid board
    // Returns true if all the checks above pass
    function check_win(board: Board) -> bool {
        return (
            check_rows(board) &&
            check_columns(board) &&
            check_nonets(board) &&
            check_sum(board)
        );
    }

    // Play a game of sudoku
    // Returns the winning board
    transition play_game(board: Board, num: u8) -> Board {
        
        //Unpack the entries of the board into variables
        let r1c1: u8 = board.r1.c1;
        let r1c2: u8 = board.r1.c2;
        let r1c3: u8 = board.r1.c3;
        let r1c4: u8 = board.r1.c4;
        let r1c5: u8 = board.r1.c5;
        let r1c6: u8 = board.r1.c6;
        let r1c7: u8 = board.r1.c7;
        let r1c8: u8 = board.r1.c8;
        let r1c9: u8 = board.r1.c9;
        let r2c1: u8 = board.r2.c1;
        let r2c2: u8 = board.r2.c2;
        let r2c3: u8 = board.r2.c3;
        let r2c4: u8 = board.r2.c4;
        let r2c5: u8 = board.r2.c5;
        let r2c6: u8 = board.r2.c6;
        let r2c7: u8 = board.r2.c7;
        let r2c8: u8 = board.r2.c8;
        let r2c9: u8 = board.r2.c9;
        let r3c1: u8 = board.r3.c1;
        let r3c2: u8 = board.r3.c2;
        let r3c3: u8 = board.r3.c3;
        let r3c4: u8 = board.r3.c4;
        let r3c5: u8 = board.r3.c5;
        let r3c6: u8 = board.r3.c6;
        let r3c7: u8 = board.r3.c7;
        let r3c8: u8 = board.r3.c8;
        let r3c9: u8 = board.r3.c9;
        let r4c1: u8 = board.r4.c1;
        let r4c2: u8 = board.r4.c2;
        let r4c3: u8 = board.r4.c3;
        let r4c4: u8 = board.r4.c4;
        let r4c5: u8 = board.r4.c5;
        let r4c6: u8 = board.r4.c6;
        let r4c7: u8 = board.r4.c7;
        let r4c8: u8 = board.r4.c8;
        let r4c9: u8 = board.r4.c9;
        let r5c1: u8 = board.r5.c1;
        let r5c2: u8 = board.r5.c2;
        let r5c3: u8 = board.r5.c3;
        let r5c4: u8 = board.r5.c4;
        let r5c5: u8 = board.r5.c5;
        let r5c6: u8 = board.r5.c6;
        let r5c7: u8 = board.r5.c7;
        let r5c8: u8 = board.r5.c8;
        let r5c9: u8 = board.r5.c9;
        let r6c1: u8 = board.r6.c1;
        let r6c2: u8 = board.r6.c2;
        let r6c3: u8 = board.r6.c3;
        let r6c4: u8 = board.r6.c4;
        let r6c5: u8 = board.r6.c5;
        let r6c6: u8 = board.r6.c6;
        let r6c7: u8 = board.r6.c7;
        let r6c8: u8 = board.r6.c8;
        let r6c9: u8 = board.r6.c9;
        let r7c1: u8 = board.r7.c1;
        let r7c2: u8 = board.r7.c2;
        let r7c3: u8 = board.r7.c3;
        let r7c4: u8 = board.r7.c4;
        let r7c5: u8 = board.r7.c5;
        let r7c6: u8 = board.r7.c6;
        let r7c7: u8 = board.r7.c7;
        let r7c8: u8 = board.r7.c8;
        let r7c9: u8 = board.r7.c9;
        let r8c1: u8 = board.r8.c1;
        let r8c2: u8 = board.r8.c2;
        let r8c3: u8 = board.r8.c3;
        let r8c4: u8 = board.r8.c4;
        let r8c5: u8 = board.r8.c5;
        let r8c6: u8 = board.r8.c6;
        let r8c7: u8 = board.r8.c7;
        let r8c8: u8 = board.r8.c8;
        let r8c9: u8 = board.r8.c9;
        let r9c1: u8 = board.r9.c1;
        let r9c2: u8 = board.r9.c2;
        let r9c3: u8 = board.r9.c3;
        let r9c4: u8 = board.r9.c4;
        let r9c5: u8 = board.r9.c5;
        let r9c6: u8 = board.r9.c6;
        let r9c7: u8 = board.r9.c7;
        let r9c8: u8 = board.r9.c8;
        let r9c9: u8 = board.r9.c9;
        
    }





















}
