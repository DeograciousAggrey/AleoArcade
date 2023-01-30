program sudoku.leo {
        //Define a Row 
        //Use a struct
        //Each row has 9 columns

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

        //Define a Sudoku Board
        //Use a struct
        //Each board has 9 rows

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


        //A transition function called is_valid_solution 
        //Takes two boards as input unsolved and solved
        // The transition function returns true if the solved board is a valid solution to the unsolved board

        transition is_valid_solution (unsolvedBoard: Board, solvedBoard: Board) -> bool {
        //Check if each number in the solved board is in the range 1-9(inclusive)
        //Unpack the components of the solved board into a 2D array
        //Each cell in the 2D array must meet the above condition

        let solvedBoardArray:u8 = [solvedBoard.r1.c1, solvedBoard.r1.c2, solvedBoard.r1.c3, solvedBoard.r1.c4, solvedBoard.r1.c5, solvedBoard.r1.c6, solvedBoard.r1.c7, solvedBoard.r1.c8, solvedBoard.r1.c9,
        solvedBoard.r2.c1, solvedBoard.r2.c2, solvedBoard.r2.c3, solvedBoard.r2.c4, solvedBoard.r2.c5, solvedBoard.r2.c6, solvedBoard.r2.c7, solvedBoard.r2.c8, solvedBoard.r2.c9,
        solvedBoard.r3.c1, solvedBoard.r3.c2, solvedBoard.r3.c3, solvedBoard.r3.c4, solvedBoard.r3.c5, solvedBoard.r3.c6, solvedBoard.r3.c7, solvedBoard.r3.c8, solvedBoard.r3.c9,
        solvedBoard.r4.c1, solvedBoard.r4.c2, solvedBoard.r4.c3, solvedBoard.r4.c4, solvedBoard.r4.c5, solvedBoard.r4.c6, solvedBoard.r4.c7, solvedBoard.r4.c8, solvedBoard.r4.c9,
        solvedBoard.r5.c1, solvedBoard.r5.c2, solvedBoard.r5.c3, solvedBoard.r5.c4, solvedBoard.r5.c5, solvedBoard.r5.c6, solvedBoard.r5.c7, solvedBoard.r5.c8, solvedBoard.r5.c9,
        solvedBoard.r6.c1, solvedBoard.r6.c2, solvedBoard.r6.c3, solvedBoard.r6.c4, solvedBoard.r6.c5, solvedBoard.r6.c6, solvedBoard.r6.c7, solvedBoard.r6.c8, solvedBoard.r6.c9,
        solvedBoard.r7.c1, solvedBoard.r7.c2, solvedBoard.r7.c3, solvedBoard.r7.c4, solvedBoard.r7.c5, solvedBoard.r7.c6, solvedBoard.r7.c7, solvedBoard.r7.c8, solvedBoard.r7.c9,
        solvedBoard.r8.c1, solvedBoard.r8.c2, solvedBoard.r8.c3, solvedBoard.r8.c4, solvedBoard.r8.c5, solvedBoard.r8.c6, solvedBoard.r8.c7, solvedBoard.r8.c8, solvedBoard.r8.c9,
        solvedBoard.r9.c1, solvedBoard.r9.c2, solvedBoard.r9.c3, solvedBoard.r9.c4, solvedBoard.r9.c5, solvedBoard.r9.c6, solvedBoard.r9.c7, solvedBoard.r9.c8, solvedBoard.r9.c9];

        //Loop through the 2D array and check if each number is in the range 1-9 (inclusive)

        for i: u8 in 0u8..81u8 {
            if solvedBoardArray[i] < 1u8 || solvedBoardArray[i] > 9u8 {
                return false;
            }
        }   





















        


        
        return true;
        }


}