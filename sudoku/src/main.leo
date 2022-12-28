
program sudoku.aleo {
    // A row in a sudoku board.
    // - `c1` : The first entry in the row.
    // - `c2` : The second entry in the row.
    // - `c3` : The third entry in the row.
    // - `c4` : The fourth entry in the row.
    // - `c5` : The fifth entry in the row.
    // - `c6` : The sixth entry in the row.
    // - `c7` : The seventh entry in the row.
    // - `c8` : The eighth entry in the row.
    // - `c9` : The ninth entry in the row.
    // A valid entry is a number between 1 and 9, inclusive. Any other values are invalid.
    struct Row {
        c1: u8,
        c2: u8,
        c3: u8,
        c4: u8,
        c5: u8,
        c6: u8,
        c7: u8,
        c8: u8,
        c9: u8
    }

    // A sudoku board.
    // - `r1` : The first row in the board.
    // - `r2` : The second row in the board.
    // - `r3` : The third row in the board.
    // - `r4` : The fourth row in the board.
    // - `r5` : The fifth row in the board.
    // - `r6` : The sixth row in the board.
    // - `r7` : The seventh row in the board.
    // - `r8` : The eighth row in the board.
    // - `r9` : The ninth row in the board.
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

    // input two boards proposed 
   transition validate_proposed_solution(proposedsoln: Board,unsolvedboard: Board) -> bool {
    // check if the proposed solution is valid
    // Propsedsoln is valid if the following conditions are true
    // 1. proposed solution is has numbers between 1 and 9 inclusive
    // 2. proposed solution is has no duplicates in a row 
    // 3. proposed solution is has no duplicates in a column
    // 4. proposed solution is has no duplicates in a 3x3 box
    // 5. The initial state of the solution is the same as the unsolved board
    

    // If all the checks are true, return true
    // else return false

    // Unpack entries of the proposed solution and unsolved board into variables

    //Proposed solution
    let propr1c1: u8 = proposedsoln.r1.c1;
    let propr1c2: u8 = proposedsoln.r1.c2;
    let propr1c3: u8 = proposedsoln.r1.c3;
    let propr1c4: u8 = proposedsoln.r1.c4;
    let propr1c5: u8 = proposedsoln.r1.c5;
    let propr1c6: u8 = proposedsoln.r1.c6;
    let propr1c7: u8 = proposedsoln.r1.c7;
    let propr1c8: u8 = proposedsoln.r1.c8;
    let propr1c9: u8 = proposedsoln.r1.c9;

    let propr2c1: u8 = proposedsoln.r2.c1;
    let propr2c2: u8 = proposedsoln.r2.c2;
    let propr2c3: u8 = proposedsoln.r2.c3;
    let propr2c4: u8 = proposedsoln.r2.c4;
    let propr2c5: u8 = proposedsoln.r2.c5;
    let propr2c6: u8 = proposedsoln.r2.c6;
    let propr2c7: u8 = proposedsoln.r2.c7;
    let propr2c8: u8 = proposedsoln.r2.c8;
    let propr2c9: u8 = proposedsoln.r2.c9;

    let propr3c1: u8 = proposedsoln.r3.c1;
    let propr3c2: u8 = proposedsoln.r3.c2;
    let propr3c3: u8 = proposedsoln.r3.c3;
    let propr3c4: u8 = proposedsoln.r3.c4;
    let propr3c5: u8 = proposedsoln.r3.c5;
    let propr3c6: u8 = proposedsoln.r3.c6;
    let propr3c7: u8 = proposedsoln.r3.c7;
    let propr3c8: u8 = proposedsoln.r3.c8;
    let propr3c9: u8 = proposedsoln.r3.c9;

    let propr4c1: u8 = proposedsoln.r4.c1;
    let propr4c2: u8 = proposedsoln.r4.c2;
    let propr4c3: u8 = proposedsoln.r4.c3;
    let propr4c4: u8 = proposedsoln.r4.c4;
    let propr4c5: u8 = proposedsoln.r4.c5;
    let propr4c6: u8 = proposedsoln.r4.c6;
    let propr4c7: u8 = proposedsoln.r4.c7;
    let propr4c8: u8 = proposedsoln.r4.c8;
    let propr4c9: u8 = proposedsoln.r4.c9;

    let propr5c1: u8 = proposedsoln.r5.c1;
    let propr5c2: u8 = proposedsoln.r5.c2;
    let propr5c3: u8 = proposedsoln.r5.c3;
    let propr5c4: u8 = proposedsoln.r5.c4;
    let propr5c5: u8 = proposedsoln.r5.c5;
    let propr5c6: u8 = proposedsoln.r5.c6;
    let propr5c7: u8 = proposedsoln.r5.c7;
    let propr5c8: u8 = proposedsoln.r5.c8;
    let propr5c9: u8 = proposedsoln.r5.c9;

    let propr6c1: u8 = proposedsoln.r6.c1;
    let propr6c2: u8 = proposedsoln.r6.c2;
    let propr6c3: u8 = proposedsoln.r6.c3;
    let propr6c4: u8 = proposedsoln.r6.c4;
    let propr6c5: u8 = proposedsoln.r6.c5;
    let propr6c6: u8 = proposedsoln.r6.c6;
    let propr6c7: u8 = proposedsoln.r6.c7;
    let propr6c8: u8 = proposedsoln.r6.c8;
    let propr6c9: u8 = proposedsoln.r6.c9;

    let propr7c1: u8 = proposedsoln.r7.c1;
    let propr7c2: u8 = proposedsoln.r7.c2;
    let propr7c3: u8 = proposedsoln.r7.c3;
    let propr7c4: u8 = proposedsoln.r7.c4;
    let propr7c5: u8 = proposedsoln.r7.c5;
    let propr7c6: u8 = proposedsoln.r7.c6;
    let propr7c7: u8 = proposedsoln.r7.c7;
    let propr7c8: u8 = proposedsoln.r7.c8;
    let propr7c9: u8 = proposedsoln.r7.c9;

    let propr8c1: u8 = proposedsoln.r8.c1;
    let propr8c2: u8 = proposedsoln.r8.c2;
    let propr8c3: u8 = proposedsoln.r8.c3;
    let propr8c4: u8 = proposedsoln.r8.c4;
    let propr8c5: u8 = proposedsoln.r8.c5;
    let propr8c6: u8 = proposedsoln.r8.c6;
    let propr8c7: u8 = proposedsoln.r8.c7;
    let propr8c8: u8 = proposedsoln.r8.c8;
    let propr8c9: u8 = proposedsoln.r8.c9;

    let propr9c1: u8 = proposedsoln.r9.c1;
    let propr9c2: u8 = proposedsoln.r9.c2;
    let propr9c3: u8 = proposedsoln.r9.c3;
    let propr9c4: u8 = proposedsoln.r9.c4;
    let propr9c5: u8 = proposedsoln.r9.c5;
    let propr9c6: u8 = proposedsoln.r9.c6;
    let propr9c7: u8 = proposedsoln.r9.c7;
    let propr9c8: u8 = proposedsoln.r9.c8;
    let propr9c9: u8 = proposedsoln.r9.c9;

    // Unsolved Board
    let unsolvedR1C1: u8 = unsolvedboard.r1.c1;
    let unsolvedR1C2: u8 = unsolvedboard.r1.c2;
    let unsolvedR1C3: u8 = unsolvedboard.r1.c3;
    let unsolvedR1C4: u8 = unsolvedboard.r1.c4;
    let unsolvedR1C5: u8 = unsolvedboard.r1.c5;
    let unsolvedR1C6: u8 = unsolvedboard.r1.c6;
    let unsolvedR1C7: u8 = unsolvedboard.r1.c7;
    let unsolvedR1C8: u8 = unsolvedboard.r1.c8;
    let unsolvedR1C9: u8 = unsolvedboard.r1.c9;

    let unsolvedR2C1: u8 = unsolvedboard.r2.c1;
    let unsolvedR2C2: u8 = unsolvedboard.r2.c2;
    let unsolvedR2C3: u8 = unsolvedboard.r2.c3;
    let unsolvedR2C4: u8 = unsolvedboard.r2.c4;
    let unsolvedR2C5: u8 = unsolvedboard.r2.c5;
    let unsolvedR2C6: u8 = unsolvedboard.r2.c6;
    let unsolvedR2C7: u8 = unsolvedboard.r2.c7;
    let unsolvedR2C8: u8 = unsolvedboard.r2.c8;
    let unsolvedR2C9: u8 = unsolvedboard.r2.c9;

    let unsolvedR3C1: u8 = unsolvedboard.r3.c1;
    let unsolvedR3C2: u8 = unsolvedboard.r3.c2;
    let unsolvedR3C3: u8 = unsolvedboard.r3.c3;
    let unsolvedR3C4: u8 = unsolvedboard.r3.c4;
    let unsolvedR3C5: u8 = unsolvedboard.r3.c5;
    let unsolvedR3C6: u8 = unsolvedboard.r3.c6;
    let unsolvedR3C7: u8 = unsolvedboard.r3.c7;
    let unsolvedR3C8: u8 = unsolvedboard.r3.c8;
    let unsolvedR3C9: u8 = unsolvedboard.r3.c9;

    let unsolvedR4C1: u8 = unsolvedboard.r4.c1;
    let unsolvedR4C2: u8 = unsolvedboard.r4.c2;
    let unsolvedR4C3: u8 = unsolvedboard.r4.c3;
    let unsolvedR4C4: u8 = unsolvedboard.r4.c4;
    let unsolvedR4C5: u8 = unsolvedboard.r4.c5;
    let unsolvedR4C6: u8 = unsolvedboard.r4.c6;
    let unsolvedR4C7: u8 = unsolvedboard.r4.c7;
    let unsolvedR4C8: u8 = unsolvedboard.r4.c8;
    let unsolvedR4C9: u8 = unsolvedboard.r4.c9;

    let unsolvedR5C1: u8 = unsolvedboard.r5.c1;
    let unsolvedR5C2: u8 = unsolvedboard.r5.c2;
    let unsolvedR5C3: u8 = unsolvedboard.r5.c3;
    let unsolvedR5C4: u8 = unsolvedboard.r5.c4;
    let unsolvedR5C5: u8 = unsolvedboard.r5.c5;
    let unsolvedR5C6: u8 = unsolvedboard.r5.c6;
    let unsolvedR5C7: u8 = unsolvedboard.r5.c7;
    let unsolvedR5C8: u8 = unsolvedboard.r5.c8;
    let unsolvedR5C9: u8 = unsolvedboard.r5.c9;

    let unsolvedR6C1: u8 = unsolvedboard.r6.c1;
    let unsolvedR6C2: u8 = unsolvedboard.r6.c2;
    let unsolvedR6C3: u8 = unsolvedboard.r6.c3;
    let unsolvedR6C4: u8 = unsolvedboard.r6.c4;
    let unsolvedR6C5: u8 = unsolvedboard.r6.c5;
    let unsolvedR6C6: u8 = unsolvedboard.r6.c6;
    let unsolvedR6C7: u8 = unsolvedboard.r6.c7;
    let unsolvedR6C8: u8 = unsolvedboard.r6.c8;
    let unsolvedR6C9: u8 = unsolvedboard.r6.c9;

    let unsolvedR7C1: u8 = unsolvedboard.r7.c1;
    let unsolvedR7C2: u8 = unsolvedboard.r7.c2;
    let unsolvedR7C3: u8 = unsolvedboard.r7.c3;
    let unsolvedR7C4: u8 = unsolvedboard.r7.c4;
    let unsolvedR7C5: u8 = unsolvedboard.r7.c5;
    let unsolvedR7C6: u8 = unsolvedboard.r7.c6;
    let unsolvedR7C7: u8 = unsolvedboard.r7.c7;
    let unsolvedR7C8: u8 = unsolvedboard.r7.c8;
    let unsolvedR7C9: u8 = unsolvedboard.r7.c9;

    let unsolvedR8C1: u8 = unsolvedboard.r8.c1;
    let unsolvedR8C2: u8 = unsolvedboard.r8.c2;
    let unsolvedR8C3: u8 = unsolvedboard.r8.c3;
    let unsolvedR8C4: u8 = unsolvedboard.r8.c4;
    let unsolvedR8C5: u8 = unsolvedboard.r8.c5;
    let unsolvedR8C6: u8 = unsolvedboard.r8.c6;
    let unsolvedR8C7: u8 = unsolvedboard.r8.c7;
    let unsolvedR8C8: u8 = unsolvedboard.r8.c8;
    let unsolvedR8C9: u8 = unsolvedboard.r8.c9;

    let unsolvedR9C1: u8 = unsolvedboard.r9.c1;
    let unsolvedR9C2: u8 = unsolvedboard.r9.c2;
    let unsolvedR9C3: u8 = unsolvedboard.r9.c3;
    let unsolvedR9C4: u8 = unsolvedboard.r9.c4;
    let unsolvedR9C5: u8 = unsolvedboard.r9.c5;
    let unsolvedR9C6: u8 = unsolvedboard.r9.c6;
    let unsolvedR9C7: u8 = unsolvedboard.r9.c7;
    let unsolvedR9C8: u8 = unsolvedboard.r9.c8;
    let unsolvedR9C9: u8 = unsolvedboard.r9.c9;


    

   }

    













   }