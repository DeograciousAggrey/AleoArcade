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
        


        
        return true;
        }


}