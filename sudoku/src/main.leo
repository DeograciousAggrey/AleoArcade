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

        for i: u8 in 0u8..80u8 {
            if solvedBoardArray[i] < 1u8 || solvedBoardArray[i] > 9u8 {
                return false;
            }
        }   


        //Check that the solved board is the initial state of the unsolved board
        //If a cell in the unsolved board is not 0, then the corresponding cell in the solved board must be equal to the cell in the unsolved board
        //If a cell in the unsolved board is 0, then the corresponding cell in the solved board must be different from the cell in the unsolved board
        //Unpack the components of the unsolved board into a 2D array

        let unsolvedBoardArray:u8 = [unsolvedBoard.r1.c1, unsolvedBoard.r1.c2, unsolvedBoard.r1.c3, unsolvedBoard.r1.c4, unsolvedBoard.r1.c5, unsolvedBoard.r1.c6, unsolvedBoard.r1.c7, unsolvedBoard.r1.c8, unsolvedBoard.r1.c9,
                                    unsolvedBoard.r2.c1, unsolvedBoard.r2.c2, unsolvedBoard.r2.c3, unsolvedBoard.r2.c4, unsolvedBoard.r2.c5, unsolvedBoard.r2.c6, unsolvedBoard.r2.c7, unsolvedBoard.r2.c8, unsolvedBoard.r2.c9,
                                    unsolvedBoard.r3.c1, unsolvedBoard.r3.c2, unsolvedBoard.r3.c3, unsolvedBoard.r3.c4, unsolvedBoard.r3.c5, unsolvedBoard.r3.c6, unsolvedBoard.r3.c7, unsolvedBoard.r3.c8, unsolvedBoard.r3.c9,
                                    unsolvedBoard.r4.c1, unsolvedBoard.r4.c2, unsolvedBoard.r4.c3, unsolvedBoard.r4.c4, unsolvedBoard.r4.c5, unsolvedBoard.r4.c6, unsolvedBoard.r4.c7, unsolvedBoard.r4.c8, unsolvedBoard.r4.c9,
                                    unsolvedBoard.r5.c1, unsolvedBoard.r5.c2, unsolvedBoard.r5.c3, unsolvedBoard.r5.c4, unsolvedBoard.r5.c5, unsolvedBoard.r5.c6, unsolvedBoard.r5.c7, unsolvedBoard.r5.c8, unsolvedBoard.r5.c9,
                                    unsolvedBoard.r6.c1, unsolvedBoard.r6.c2, unsolvedBoard.r6.c3, unsolvedBoard.r6.c4, unsolvedBoard.r6.c5, unsolvedBoard.r6.c6, unsolvedBoard.r6.c7, unsolvedBoard.r6.c8, unsolvedBoard.r6.c9,
                                    unsolvedBoard.r7.c1, unsolvedBoard.r7.c2, unsolvedBoard.r7.c3, unsolvedBoard.r7.c4, unsolvedBoard.r7.c5, unsolvedBoard.r7.c6, unsolvedBoard.r7.c7, unsolvedBoard.r7.c8, unsolvedBoard.r7.c9,
                                    unsolvedBoard.r8.c1, unsolvedBoard.r8.c2, unsolvedBoard.r8.c3, unsolvedBoard.r8.c4, unsolvedBoard.r8.c5, unsolvedBoard.r8.c6, unsolvedBoard.r8.c7, unsolvedBoard.r8.c8, unsolvedBoard.r8.c9,
                                    unsolvedBoard.r9.c1, unsolvedBoard.r9.c2, unsolvedBoard.r9.c3, unsolvedBoard.r9.c4, unsolvedBoard.r9.c5, unsolvedBoard.r9.c6, unsolvedBoard.r9.c7, unsolvedBoard.r9.c8, unsolvedBoard.r9.c9];
                                    
        //Loop to ensure that the solved board is the initial state of the unsolved board
        for i: u8 in 0u8..80u8 {
            if unsolvedBoardArray[i] != 0u8 {
                if solvedBoardArray[i] != unsolvedBoardArray[i] {
                    return false;
                }
            } else {
                if solvedBoardArray[i] == unsolvedBoardArray[i] {
                    return false;
                }
            }
        }


        //check if each row in the solved puzzle have all the numbers from 1 to 9, both included.
       

                //ROW 1 
        let solvedBoardRow1:u8 = [solvedBoard.r1.c1, solvedBoard.r1.c2, solvedBoard.r1.c3, solvedBoard.r1.c4, solvedBoard.r1.c5, solvedBoard.r1.c6, solvedBoard.r1.c7, solvedBoard.r1.c8, solvedBoard.r1.c9];

            //Check that the elements in this row are unique

            if(solvedBoardRow1[0] == solvedBoardRow1[1] || solvedBoardRow1[0] == solvedBoardRow1[2] || solvedBoardRow1[0] == solvedBoardRow1[3] || solvedBoardRow1[0] == solvedBoardRow1[4] || solvedBoardRow1[0] == solvedBoardRow1[5] || solvedBoardRow1[0] == solvedBoardRow1[6] || solvedBoardRow1[0] == solvedBoardRow1[7] || solvedBoardRow1[0] == solvedBoardRow1[8]
            || solvedBoardRow1[1] == solvedBoardRow1[2] || solvedBoardRow1[1] == solvedBoardRow1[3] || solvedBoardRow1[1] == solvedBoardRow1[4] || solvedBoardRow1[1] == solvedBoardRow1[5] || solvedBoardRow1[1] == solvedBoardRow1[6] || solvedBoardRow1[1] == solvedBoardRow1[7] || solvedBoardRow1[1] == solvedBoardRow1[8]
            || solvedBoardRow1[2] == solvedBoardRow1[3] || solvedBoardRow1[2] == solvedBoardRow1[4] || solvedBoardRow1[2] == solvedBoardRow1[5] || solvedBoardRow1[2] == solvedBoardRow1[6] || solvedBoardRow1[2] == solvedBoardRow1[7] || solvedBoardRow1[2] == solvedBoardRow1[8]
            || solvedBoardRow1[3] == solvedBoardRow1[4] || solvedBoardRow1[3] == solvedBoardRow1[5] || solvedBoardRow1[3] == solvedBoardRow1[6] || solvedBoardRow1[3] == solvedBoardRow1[7] || solvedBoardRow1[3] == solvedBoardRow1[8]
            || solvedBoardRow1[4] == solvedBoardRow1[5] || solvedBoardRow1[4] == solvedBoardRow1[6] || solvedBoardRow1[4] == solvedBoardRow1[7] || solvedBoardRow1[4] == solvedBoardRow1[8]
            || solvedBoardRow1[5] == solvedBoardRow1[6] || solvedBoardRow1[5] == solvedBoardRow1[7] || solvedBoardRow1[5] == solvedBoardRow1[8]
            || solvedBoardRow1[6] == solvedBoardRow1[7] || solvedBoardRow1[6] == solvedBoardRow1[8]
            || solvedBoardRow1[7] == solvedBoardRow1[8]
            ) 
            {
                return false;
            }

            
            
            
            













        let solvedBoardRow2:u8 = [solvedBoard.r2.c1, solvedBoard.r2.c2, solvedBoard.r2.c3, solvedBoard.r2.c4, solvedBoard.r2.c5, solvedBoard.r2.c6, solvedBoard.r2.c7, solvedBoard.r2.c8, solvedBoard.r2.c9];
                //Check that the elements in this row are unique
            if(solvedBoardRow2[0] == solvedBoardRow2[1] || solvedBoardRow2[0] == solvedBoardRow2[2] || solvedBoardRow2[0] == solvedBoardRow2[3] || solvedBoardRow2[0] == solvedBoardRow2[4] || solvedBoardRow2[0] == solvedBoardRow2[5] || solvedBoardRow2[0] == solvedBoardRow2[6] || solvedBoardRow2[0] == solvedBoardRow2[7] || solvedBoardRow2[0] == solvedBoardRow2[8]
            || solvedBoardRow2[1] == solvedBoardRow2[2] || solvedBoardRow2[1] == solvedBoardRow2[3] || solvedBoardRow2[1] == solvedBoardRow2[4] || solvedBoardRow2[1] == solvedBoardRow2[5] || solvedBoardRow2[1] == solvedBoardRow2[6] || solvedBoardRow2[1] == solvedBoardRow2[7] || solvedBoardRow2[1] == solvedBoardRow2[8]
            || solvedBoardRow2[2] == solvedBoardRow2[3] || solvedBoardRow2[2] == solvedBoardRow2[4] || solvedBoardRow2[2] == solvedBoardRow2[5] || solvedBoardRow2[2] == solvedBoardRow2[6] || solvedBoardRow2[2] == solvedBoardRow2[7] || solvedBoardRow2[2] == solvedBoardRow2[8]
            || solvedBoardRow2[3] == solvedBoardRow2[4] || solvedBoardRow2[3] == solvedBoardRow2[5] || solvedBoardRow2[3] == solvedBoardRow2[6] || solvedBoardRow2[3] == solvedBoardRow2[7] || solvedBoardRow2[3] == solvedBoardRow2[8]
            || solvedBoardRow2[4] == solvedBoardRow2[5] || solvedBoardRow2[4] == solvedBoardRow2[6] || solvedBoardRow2[4] == solvedBoardRow2[7] || solvedBoardRow2[4] == solvedBoardRow2[8]
            || solvedBoardRow2[5] == solvedBoardRow2[6] || solvedBoardRow2[5] == solvedBoardRow2[7] || solvedBoardRow2[5] == solvedBoardRow2[8]
            || solvedBoardRow2[6] == solvedBoardRow2[7] || solvedBoardRow2[6] == solvedBoardRow2[8]
            || solvedBoardRow2[7] == solvedBoardRow2[8]
            ) 
            {
                return false;
            }



        let solvedBoardRow3:u8 = [solvedBoard.r3.c1, solvedBoard.r3.c2, solvedBoard.r3.c3, solvedBoard.r3.c4, solvedBoard.r3.c5, solvedBoard.r3.c6, solvedBoard.r3.c7, solvedBoard.r3.c8, solvedBoard.r3.c9];

                //Check that the elements in this row are unique

            if(solvedBoardRow3[0] == solvedBoardRow3[1] || solvedBoardRow3[0] == solvedBoardRow3[2] || solvedBoardRow3[0] == solvedBoardRow3[3] || solvedBoardRow3[0] == solvedBoardRow3[4] || solvedBoardRow3[0] == solvedBoardRow3[5] || solvedBoardRow3[0] == solvedBoardRow3[6] || solvedBoardRow3[0] == solvedBoardRow3[7] || solvedBoardRow3[0] == solvedBoardRow3[8]
            || solvedBoardRow3[1] == solvedBoardRow3[2] || solvedBoardRow3[1] == solvedBoardRow3[3] || solvedBoardRow3[1] == solvedBoardRow3[4] || solvedBoardRow3[1] == solvedBoardRow3[5] || solvedBoardRow3[1] == solvedBoardRow3[6] || solvedBoardRow3[1] == solvedBoardRow3[7] || solvedBoardRow3[1] == solvedBoardRow3[8]
            || solvedBoardRow3[2] == solvedBoardRow3[3] || solvedBoardRow3[2] == solvedBoardRow3[4] || solvedBoardRow3[2] == solvedBoardRow3[5] || solvedBoardRow3[2] == solvedBoardRow3[6] || solvedBoardRow3[2] == solvedBoardRow3[7] || solvedBoardRow3[2] == solvedBoardRow3[8]
            || solvedBoardRow3[3] == solvedBoardRow3[4] || solvedBoardRow3[3] == solvedBoardRow3[5] || solvedBoardRow3[3] == solvedBoardRow3[6] || solvedBoardRow3[3] == solvedBoardRow3[7] || solvedBoardRow3[3] == solvedBoardRow3[8]
            || solvedBoardRow3[4] == solvedBoardRow3[5] || solvedBoardRow3[4] == solvedBoardRow3[6] || solvedBoardRow3[4] == solvedBoardRow3[7] || solvedBoardRow3[4] == solvedBoardRow3[8]
            || solvedBoardRow3[5] == solvedBoardRow3[6] || solvedBoardRow3[5] == solvedBoardRow3[7] || solvedBoardRow3[5] == solvedBoardRow3[8]
            || solvedBoardRow3[6] == solvedBoardRow3[7] || solvedBoardRow3[6] == solvedBoardRow3[8]
            || solvedBoardRow3[7] == solvedBoardRow3[8]
            ) 
            {
                return false;
            }



        let solvedBoardRow4:u8 = [solvedBoard.r4.c1, solvedBoard.r4.c2, solvedBoard.r4.c3, solvedBoard.r4.c4, solvedBoard.r4.c5, solvedBoard.r4.c6, solvedBoard.r4.c7, solvedBoard.r4.c8, solvedBoard.r4.c9];

                //Check that the elements in this row are unique

            if(solvedBoardRow4[0] == solvedBoardRow4[1] || solvedBoardRow4[0] == solvedBoardRow4[2] || solvedBoardRow4[0] == solvedBoardRow4[3] || solvedBoardRow4[0] == solvedBoardRow4[4] || solvedBoardRow4[0] == solvedBoardRow4[5] || solvedBoardRow4[0] == solvedBoardRow4[6] || solvedBoardRow4[0] == solvedBoardRow4[7] || solvedBoardRow4[0] == solvedBoardRow4[8]
            || solvedBoardRow4[1] == solvedBoardRow4[2] || solvedBoardRow4[1] == solvedBoardRow4[3] || solvedBoardRow4[1] == solvedBoardRow4[4] || solvedBoardRow4[1] == solvedBoardRow4[5] || solvedBoardRow4[1] == solvedBoardRow4[6] || solvedBoardRow4[1] == solvedBoardRow4[7] || solvedBoardRow4[1] == solvedBoardRow4[8]
            || solvedBoardRow4[2] == solvedBoardRow4[3] || solvedBoardRow4[2] == solvedBoardRow4[4] || solvedBoardRow4[2] == solvedBoardRow4[5] || solvedBoardRow4[2] == solvedBoardRow4[6] || solvedBoardRow4[2] == solvedBoardRow4[7] || solvedBoardRow4[2] == solvedBoardRow4[8]
            || solvedBoardRow4[3] == solvedBoardRow4[4] || solvedBoardRow4[3] == solvedBoardRow4[5] || solvedBoardRow4[3] == solvedBoardRow4[6] || solvedBoardRow4[3] == solvedBoardRow4[7] || solvedBoardRow4[3] == solvedBoardRow4[8]
            || solvedBoardRow4[4] == solvedBoardRow4[5] || solvedBoardRow4[4] == solvedBoardRow4[6] || solvedBoardRow4[4] == solvedBoardRow4[7] || solvedBoardRow4[4] == solvedBoardRow4[8]
            || solvedBoardRow4[5] == solvedBoardRow4[6] || solvedBoardRow4[5] == solvedBoardRow4[7] || solvedBoardRow4[5] == solvedBoardRow4[8]
            || solvedBoardRow4[6] == solvedBoardRow4[7] || solvedBoardRow4[6] == solvedBoardRow4[8]
            || solvedBoardRow4[7] == solvedBoardRow4[8]
            ) 
            {
                return false;
            }


        let solvedBoardRow5:u8 = [solvedBoard.r5.c1, solvedBoard.r5.c2, solvedBoard.r5.c3, solvedBoard.r5.c4, solvedBoard.r5.c5, solvedBoard.r5.c6, solvedBoard.r5.c7, solvedBoard.r5.c8, solvedBoard.r5.c9];


                //Check that the elements in this row are unique

           if(solvedBoardRow5[0] == solvedBoardRow5[1] || solvedBoardRow5[0] == solvedBoardRow5[2] || solvedBoardRow5[0] == solvedBoardRow5[3] || solvedBoardRow5[0] == solvedBoardRow5[4] || solvedBoardRow5[0] == solvedBoardRow5[5] || solvedBoardRow5[0] == solvedBoardRow5[6] || solvedBoardRow5[0] == solvedBoardRow5[7] || solvedBoardRow5[0] == solvedBoardRow5[8]
            || solvedBoardRow5[1] == solvedBoardRow5[2] || solvedBoardRow5[1] == solvedBoardRow5[3] || solvedBoardRow5[1] == solvedBoardRow5[4] || solvedBoardRow5[1] == solvedBoardRow5[5] || solvedBoardRow5[1] == solvedBoardRow5[6] || solvedBoardRow5[1] == solvedBoardRow5[7] || solvedBoardRow5[1] == solvedBoardRow5[8]
            || solvedBoardRow5[2] == solvedBoardRow5[3] || solvedBoardRow5[2] == solvedBoardRow5[4] || solvedBoardRow5[2] == solvedBoardRow5[5] || solvedBoardRow5[2] == solvedBoardRow5[6] || solvedBoardRow5[2] == solvedBoardRow5[7] || solvedBoardRow5[2] == solvedBoardRow5[8]
            || solvedBoardRow5[3] == solvedBoardRow5[4] || solvedBoardRow5[3] == solvedBoardRow5[5] || solvedBoardRow5[3] == solvedBoardRow5[6] || solvedBoardRow5[3] == solvedBoardRow5[7] || solvedBoardRow5[3] == solvedBoardRow5[8]
            || solvedBoardRow5[4] == solvedBoardRow5[5] || solvedBoardRow5[4] == solvedBoardRow5[6] || solvedBoardRow5[4] == solvedBoardRow5[7] || solvedBoardRow5[4] == solvedBoardRow5[8]
            || solvedBoardRow5[5] == solvedBoardRow5[6] || solvedBoardRow5[5] == solvedBoardRow5[7] || solvedBoardRow5[5] == solvedBoardRow5[8]
            || solvedBoardRow5[6] == solvedBoardRow5[7] || solvedBoardRow5[6] == solvedBoardRow5[8]
            || solvedBoardRow5[7] == solvedBoardRow5[8]
            ) 
            {
                return false;
            }



        let solvedBoardRow6:u8 = [solvedBoard.r6.c1, solvedBoard.r6.c2, solvedBoard.r6.c3, solvedBoard.r6.c4, solvedBoard.r6.c5, solvedBoard.r6.c6, solvedBoard.r6.c7, solvedBoard.r6.c8, solvedBoard.r6.c9];


                //Check that the elements in this row are unique

              if(solvedBoardRow6[0] == solvedBoardRow6[1] || solvedBoardRow6[0] == solvedBoardRow6[2] || solvedBoardRow6[0] == solvedBoardRow6[3] || solvedBoardRow6[0] == solvedBoardRow6[4] || solvedBoardRow6[0] == solvedBoardRow6[5] || solvedBoardRow6[0] == solvedBoardRow6[6] || solvedBoardRow6[0] == solvedBoardRow6[7] || solvedBoardRow6[0] == solvedBoardRow6[8]
            || solvedBoardRow6[1] == solvedBoardRow6[2] || solvedBoardRow6[1] == solvedBoardRow6[3] || solvedBoardRow6[1] == solvedBoardRow6[4] || solvedBoardRow6[1] == solvedBoardRow6[5] || solvedBoardRow6[1] == solvedBoardRow6[6] || solvedBoardRow6[1] == solvedBoardRow6[7] || solvedBoardRow6[1] == solvedBoardRow6[8]
            || solvedBoardRow6[2] == solvedBoardRow6[3] || solvedBoardRow6[2] == solvedBoardRow6[4] || solvedBoardRow6[2] == solvedBoardRow6[5] || solvedBoardRow6[2] == solvedBoardRow6[6] || solvedBoardRow6[2] == solvedBoardRow6[7] || solvedBoardRow6[2] == solvedBoardRow6[8]
            || solvedBoardRow6[3] == solvedBoardRow6[4] || solvedBoardRow6[3] == solvedBoardRow6[5] || solvedBoardRow6[3] == solvedBoardRow6[6] || solvedBoardRow6[3] == solvedBoardRow6[7] || solvedBoardRow6[3] == solvedBoardRow6[8]
            || solvedBoardRow6[4] == solvedBoardRow6[5] || solvedBoardRow6[4] == solvedBoardRow6[6] || solvedBoardRow6[4] == solvedBoardRow6[7] || solvedBoardRow6[4] == solvedBoardRow6[8]
            || solvedBoardRow6[5] == solvedBoardRow6[6] || solvedBoardRow6[5] == solvedBoardRow6[7] || solvedBoardRow6[5] == solvedBoardRow6[8]
            || solvedBoardRow6[6] == solvedBoardRow6[7] || solvedBoardRow6[6] == solvedBoardRow6[8]
            || solvedBoardRow6[7] == solvedBoardRow6[8]
            ) 
            {
                return false;
            }




        let solvedBoardRow7:u8 = [solvedBoard.r7.c1, solvedBoard.r7.c2, solvedBoard.r7.c3, solvedBoard.r7.c4, solvedBoard.r7.c5, solvedBoard.r7.c6, solvedBoard.r7.c7, solvedBoard.r7.c8, solvedBoard.r7.c9];

                // check that the elements in this row are unique

            if(solvedBoardRow7[0] == solvedBoardRow7[1] || solvedBoardRow7[0] == solvedBoardRow7[2] || solvedBoardRow7[0] == solvedBoardRow7[3] || solvedBoardRow7[0] == solvedBoardRow7[4] || solvedBoardRow7[0] == solvedBoardRow7[5] || solvedBoardRow7[0] == solvedBoardRow7[6] || solvedBoardRow7[0] == solvedBoardRow7[7] || solvedBoardRow7[0] == solvedBoardRow7[8]
            || solvedBoardRow7[1] == solvedBoardRow7[2] || solvedBoardRow7[1] == solvedBoardRow7[3] || solvedBoardRow7[1] == solvedBoardRow7[4] || solvedBoardRow7[1] == solvedBoardRow7[5] || solvedBoardRow7[1] == solvedBoardRow7[6] || solvedBoardRow7[1] == solvedBoardRow7[7] || solvedBoardRow7[1] == solvedBoardRow7[8]
            || solvedBoardRow7[2] == solvedBoardRow7[3] || solvedBoardRow7[2] == solvedBoardRow7[4] || solvedBoardRow7[2] == solvedBoardRow7[5] || solvedBoardRow7[2] == solvedBoardRow7[6] || solvedBoardRow7[2] == solvedBoardRow7[7] || solvedBoardRow7[2] == solvedBoardRow7[8]
            || solvedBoardRow7[3] == solvedBoardRow7[4] || solvedBoardRow7[3] == solvedBoardRow7[5] || solvedBoardRow7[3] == solvedBoardRow7[6] || solvedBoardRow7[3] == solvedBoardRow7[7] || solvedBoardRow7[3] == solvedBoardRow7[8]
            || solvedBoardRow7[4] == solvedBoardRow7[5] || solvedBoardRow7[4] == solvedBoardRow7[6] || solvedBoardRow7[4] == solvedBoardRow7[7] || solvedBoardRow7[4] == solvedBoardRow7[8]
            || solvedBoardRow7[5] == solvedBoardRow7[6] || solvedBoardRow7[5] == solvedBoardRow7[7] || solvedBoardRow7[5] == solvedBoardRow7[8]
            || solvedBoardRow7[6] == solvedBoardRow7[7] || solvedBoardRow7[6] == solvedBoardRow7[8]
            || solvedBoardRow7[7] == solvedBoardRow7[8]
            ) 
            {
                return false;
            }





        let solvedBoardRow8:u8 = [solvedBoard.r8.c1, solvedBoard.r8.c2, solvedBoard.r8.c3, solvedBoard.r8.c4, solvedBoard.r8.c5, solvedBoard.r8.c6, solvedBoard.r8.c7, solvedBoard.r8.c8, solvedBoard.r8.c9];

                //Check that the elements in this row are unique

            if(solvedBoardRow8[0] == solvedBoardRow8[1] || solvedBoardRow8[0] == solvedBoardRow8[2] || solvedBoardRow8[0] == solvedBoardRow8[3] || solvedBoardRow8[0] == solvedBoardRow8[4] || solvedBoardRow8[0] == solvedBoardRow8[5] || solvedBoardRow8[0] == solvedBoardRow8[6] || solvedBoardRow8[0] == solvedBoardRow8[7] || solvedBoardRow8[0] == solvedBoardRow8[8]
            || solvedBoardRow8[1] == solvedBoardRow8[2] || solvedBoardRow8[1] == solvedBoardRow8[3] || solvedBoardRow8[1] == solvedBoardRow8[4] || solvedBoardRow8[1] == solvedBoardRow8[5] || solvedBoardRow8[1] == solvedBoardRow8[6] || solvedBoardRow8[1] == solvedBoardRow8[7] || solvedBoardRow8[1] == solvedBoardRow8[8]
            || solvedBoardRow8[2] == solvedBoardRow8[3] || solvedBoardRow8[2] == solvedBoardRow8[4] || solvedBoardRow8[2] == solvedBoardRow8[5] || solvedBoardRow8[2] == solvedBoardRow8[6] || solvedBoardRow8[2] == solvedBoardRow8[7] || solvedBoardRow8[2] == solvedBoardRow8[8]
            || solvedBoardRow8[3] == solvedBoardRow8[4] || solvedBoardRow8[3] == solvedBoardRow8[5] || solvedBoardRow8[3] == solvedBoardRow8[6] || solvedBoardRow8[3] == solvedBoardRow8[7] || solvedBoardRow8[3] == solvedBoardRow8[8]
            || solvedBoardRow8[4] == solvedBoardRow8[5] || solvedBoardRow8[4] == solvedBoardRow8[6] || solvedBoardRow8[4] == solvedBoardRow8[7] || solvedBoardRow8[4] == solvedBoardRow8[8]
            || solvedBoardRow8[5] == solvedBoardRow8[6] || solvedBoardRow8[5] == solvedBoardRow8[7] || solvedBoardRow8[5] == solvedBoardRow8[8]
            || solvedBoardRow8[6] == solvedBoardRow8[7] || solvedBoardRow8[6] == solvedBoardRow8[8]
            || solvedBoardRow8[7] == solvedBoardRow8[8]
            ) 
            {
                return false;
            }



        let solvedBoardRow9:u8 = [solvedBoard.r9.c1, solvedBoard.r9.c2, solvedBoard.r9.c3, solvedBoard.r9.c4, solvedBoard.r9.c5, solvedBoard.r9.c6, solvedBoard.r9.c7, solvedBoard.r9.c8, solvedBoard.r9.c9];

                //Check that the elements in this row are unique

            if(solvedBoardRow9[0] == solvedBoardRow9[1] || solvedBoardRow9[0] == solvedBoardRow9[2] || solvedBoardRow9[0] == solvedBoardRow9[3] || solvedBoardRow9[0] == solvedBoardRow9[4] || solvedBoardRow9[0] == solvedBoardRow9[5] || solvedBoardRow9[0] == solvedBoardRow9[6] || solvedBoardRow9[0] == solvedBoardRow9[7] || solvedBoardRow9[0] == solvedBoardRow9[8]
            || solvedBoardRow9[1] == solvedBoardRow9[2] || solvedBoardRow9[1] == solvedBoardRow9[3] || solvedBoardRow9[1] == solvedBoardRow9[4] || solvedBoardRow9[1] == solvedBoardRow9[5] || solvedBoardRow9[1] == solvedBoardRow9[6] || solvedBoardRow9[1] == solvedBoardRow9[7] || solvedBoardRow9[1] == solvedBoardRow9[8]
            || solvedBoardRow9[2] == solvedBoardRow9[3] || solvedBoardRow9[2] == solvedBoardRow9[4] || solvedBoardRow9[2] == solvedBoardRow9[5] || solvedBoardRow9[2] == solvedBoardRow9[6] || solvedBoardRow9[2] == solvedBoardRow9[7] || solvedBoardRow9[2] == solvedBoardRow9[8]
            || solvedBoardRow9[3] == solvedBoardRow9[4] || solvedBoardRow9[3] == solvedBoardRow9[5] || solvedBoardRow9[3] == solvedBoardRow9[6] || solvedBoardRow9[3] == solvedBoardRow9[7] || solvedBoardRow9[3] == solvedBoardRow9[8]
            || solvedBoardRow9[4] == solvedBoardRow9[5] || solvedBoardRow9[4] == solvedBoardRow9[6] || solvedBoardRow9[4] == solvedBoardRow9[7] || solvedBoardRow9[4] == solvedBoardRow9[8]
            || solvedBoardRow9[5] == solvedBoardRow9[6] || solvedBoardRow9[5] == solvedBoardRow9[7] || solvedBoardRow9[5] == solvedBoardRow9[8]
            || solvedBoardRow9[6] == solvedBoardRow9[7] || solvedBoardRow9[6] == solvedBoardRow9[8]
            || solvedBoardRow9[7] == solvedBoardRow9[8]
            ) 
            {
                return false;
            }




        let solvedBoardCol1:u8 = [solvedBoard.r1.c1, solvedBoard.r2.c1, solvedBoard.r3.c1, solvedBoard.r4.c1, solvedBoard.r5.c1, solvedBoard.r6.c1, solvedBoard.r7.c1, solvedBoard.r8.c1, solvedBoard.r9.c1];

                //Check that the elements in this column are unique

            if(solvedBoardCol1[0] == solvedBoardCol1[1] || solvedBoardCol1[0] == solvedBoardCol1[2] || solvedBoardCol1[0] == solvedBoardCol1[3] || solvedBoardCol1[0] == solvedBoardCol1[4] || solvedBoardCol1[0] == solvedBoardCol1[5] || solvedBoardCol1[0] == solvedBoardCol1[6] || solvedBoardCol1[0] == solvedBoardCol1[7] || solvedBoardCol1[0] == solvedBoardCol1[8]
            || solvedBoardCol1[1] == solvedBoardCol1[2] || solvedBoardCol1[1] == solvedBoardCol1[3] || solvedBoardCol1[1] == solvedBoardCol1[4] || solvedBoardCol1[1] == solvedBoardCol1[5] || solvedBoardCol1[1] == solvedBoardCol1[6] || solvedBoardCol1[1] == solvedBoardCol1[7] || solvedBoardCol1[1] == solvedBoardCol1[8]
            || solvedBoardCol1[2] == solvedBoardCol1[3] || solvedBoardCol1[2] == solvedBoardCol1[4] || solvedBoardCol1[2] == solvedBoardCol1[5] || solvedBoardCol1[2] == solvedBoardCol1[6] || solvedBoardCol1[2] == solvedBoardCol1[7] || solvedBoardCol1[2] == solvedBoardCol1[8]
            || solvedBoardCol1[3] == solvedBoardCol1[4] || solvedBoardCol1[3] == solvedBoardCol1[5] || solvedBoardCol1[3] == solvedBoardCol1[6] || solvedBoardCol1[3] == solvedBoardCol1[7] || solvedBoardCol1[3] == solvedBoardCol1[8]
            || solvedBoardCol1[4] == solvedBoardCol1[5] || solvedBoardCol1[4] == solvedBoardCol1[6] || solvedBoardCol1[4] == solvedBoardCol1[7] || solvedBoardCol1[4] == solvedBoardCol1[8]
            || solvedBoardCol1[5] == solvedBoardCol1[6] || solvedBoardCol1[5] == solvedBoardCol1[7] || solvedBoardCol1[5] == solvedBoardCol1[8]
            || solvedBoardCol1[6] == solvedBoardCol1[7] || solvedBoardCol1[6] == solvedBoardCol1[8]
            || solvedBoardCol1[7] == solvedBoardCol1[8]
            ) 
            {
                return false;
            }

        
        let solvedBoardCol2:u8 = [solvedBoard.r1.c2, solvedBoard.r2.c2, solvedBoard.r3.c2, solvedBoard.r4.c2, solvedBoard.r5.c2, solvedBoard.r6.c2, solvedBoard.r7.c2, solvedBoard.r8.c2, solvedBoard.r9.c2];

                //Check that the elements in this column are unique

            if(solvedBoardCol2[0] == solvedBoardCol2[1] || solvedBoardCol2[0] == solvedBoardCol2[2] || solvedBoardCol2[0] == solvedBoardCol2[3] || solvedBoardCol2[0] == solvedBoardCol2[4] || solvedBoardCol2[0] == solvedBoardCol2[5] || solvedBoardCol2[0] == solvedBoardCol2[6] || solvedBoardCol2[0] == solvedBoardCol2[7] || solvedBoardCol2[0] == solvedBoardCol2[8]
            || solvedBoardCol2[1] == solvedBoardCol2[2] || solvedBoardCol2[1] == solvedBoardCol2[3] || solvedBoardCol2[1] == solvedBoardCol2[4] || solvedBoardCol2[1] == solvedBoardCol2[5] || solvedBoardCol2[1] == solvedBoardCol2[6] || solvedBoardCol2[1] == solvedBoardCol2[7] || solvedBoardCol2[1] == solvedBoardCol2[8]
            || solvedBoardCol2[2] == solvedBoardCol2[3] || solvedBoardCol2[2] == solvedBoardCol2[4] || solvedBoardCol2[2] == solvedBoardCol2[5] || solvedBoardCol2[2] == solvedBoardCol2[6] || solvedBoardCol2[2] == solvedBoardCol2[7] || solvedBoardCol2[2] == solvedBoardCol2[8]
            || solvedBoardCol2[3] == solvedBoardCol2[4] || solvedBoardCol2[3] == solvedBoardCol2[5] || solvedBoardCol2[3] == solvedBoardCol2[6] || solvedBoardCol2[3] == solvedBoardCol2[7] || solvedBoardCol2[3] == solvedBoardCol2[8]
            || solvedBoardCol2[4] == solvedBoardCol2[5] || solvedBoardCol2[4] == solvedBoardCol2[6] || solvedBoardCol2[4] == solvedBoardCol2[7] || solvedBoardCol2[4] == solvedBoardCol2[8]
            || solvedBoardCol2[5] == solvedBoardCol2[6] || solvedBoardCol2[5] == solvedBoardCol2[7] || solvedBoardCol2[5] == solvedBoardCol2[8]
            || solvedBoardCol2[6] == solvedBoardCol2[7] || solvedBoardCol2[6] == solvedBoardCol2[8]
            || solvedBoardCol2[7] == solvedBoardCol2[8]
            ) 
            {
                return false;
            }



        let solvedBoardCol3:u8 = [solvedBoard.r1.c3, solvedBoard.r2.c3, solvedBoard.r3.c3, solvedBoard.r4.c3, solvedBoard.r5.c3, solvedBoard.r6.c3, solvedBoard.r7.c3, solvedBoard.r8.c3, solvedBoard.r9.c3];

                //Check that the elements in this column are unique
            if(solvedBoardCol3[0] == solvedBoardCol3[1] || solvedBoardCol3[0] == solvedBoardCol3[2] || solvedBoardCol3[0] == solvedBoardCol3[3] || solvedBoardCol3[0] == solvedBoardCol3[4] || solvedBoardCol3[0] == solvedBoardCol3[5] || solvedBoardCol3[0] == solvedBoardCol3[6] || solvedBoardCol3[0] == solvedBoardCol3[7] || solvedBoardCol3[0] == solvedBoardCol3[8]
            || solvedBoardCol3[1] == solvedBoardCol3[2] || solvedBoardCol3[1] == solvedBoardCol3[3] || solvedBoardCol3[1] == solvedBoardCol3[4] || solvedBoardCol3[1] == solvedBoardCol3[5] || solvedBoardCol3[1] == solvedBoardCol3[6] || solvedBoardCol3[1] == solvedBoardCol3[7] || solvedBoardCol3[1] == solvedBoardCol3[8]
            || solvedBoardCol3[2] == solvedBoardCol3[3] || solvedBoardCol3[2] == solvedBoardCol3[4] || solvedBoardCol3[2] == solvedBoardCol3[5] || solvedBoardCol3[2] == solvedBoardCol3[6] || solvedBoardCol3[2] == solvedBoardCol3[7] || solvedBoardCol3[2] == solvedBoardCol3[8]
            || solvedBoardCol3[3] == solvedBoardCol3[4] || solvedBoardCol3[3] == solvedBoardCol3[5] || solvedBoardCol3[3] == solvedBoardCol3[6] || solvedBoardCol3[3] == solvedBoardCol3[7] || solvedBoardCol3[3] == solvedBoardCol3[8]
            || solvedBoardCol3[4] == solvedBoardCol3[5] || solvedBoardCol3[4] == solvedBoardCol3[6] || solvedBoardCol3[4] == solvedBoardCol3[7] || solvedBoardCol3[4] == solvedBoardCol3[8]
            || solvedBoardCol3[5] == solvedBoardCol3[6] || solvedBoardCol3[5] == solvedBoardCol3[7] || solvedBoardCol3[5] == solvedBoardCol3[8]
            || solvedBoardCol3[6] == solvedBoardCol3[7] || solvedBoardCol3[6] == solvedBoardCol3[8]
            || solvedBoardCol3[7] == solvedBoardCol3[8]
            ) 
            {
                return false;
            }




        
        let solvedBoardCol4:u8 = [solvedBoard.r1.c4, solvedBoard.r2.c4, solvedBoard.r3.c4, solvedBoard.r4.c4, solvedBoard.r5.c4, solvedBoard.r6.c4, solvedBoard.r7.c4, solvedBoard.r8.c4, solvedBoard.r9.c4];
                    //Check that the elements in this column are unique
                
            if(solvedBoardCol4[0] == solvedBoardCol4[1] || solvedBoardCol4[0] == solvedBoardCol4[2] || solvedBoardCol4[0] == solvedBoardCol4[3] || solvedBoardCol4[0] == solvedBoardCol4[4] || solvedBoardCol4[0] == solvedBoardCol4[5] || solvedBoardCol4[0] == solvedBoardCol4[6] || solvedBoardCol4[0] == solvedBoardCol4[7] || solvedBoardCol4[0] == solvedBoardCol4[8]
            || solvedBoardCol4[1] == solvedBoardCol4[2] || solvedBoardCol4[1] == solvedBoardCol4[3] || solvedBoardCol4[1] == solvedBoardCol4[4] || solvedBoardCol4[1] == solvedBoardCol4[5] || solvedBoardCol4[1] == solvedBoardCol4[6] || solvedBoardCol4[1] == solvedBoardCol4[7] || solvedBoardCol4[1] == solvedBoardCol4[8]
            || solvedBoardCol4[2] == solvedBoardCol4[3] || solvedBoardCol4[2] == solvedBoardCol4[4] || solvedBoardCol4[2] == solvedBoardCol4[5] || solvedBoardCol4[2] == solvedBoardCol4[6] || solvedBoardCol4[2] == solvedBoardCol4[7] || solvedBoardCol4[2] == solvedBoardCol4[8]
            || solvedBoardCol4[3] == solvedBoardCol4[4] || solvedBoardCol4[3] == solvedBoardCol4[5] || solvedBoardCol4[3] == solvedBoardCol4[6] || solvedBoardCol4[3] == solvedBoardCol4[7] || solvedBoardCol4[3] == solvedBoardCol4[8]
            || solvedBoardCol4[4] == solvedBoardCol4[5] || solvedBoardCol4[4] == solvedBoardCol4[6] || solvedBoardCol4[4] == solvedBoardCol4[7] || solvedBoardCol4[4] == solvedBoardCol4[8]
            || solvedBoardCol4[5] == solvedBoardCol4[6] || solvedBoardCol4[5] == solvedBoardCol4[7] || solvedBoardCol4[5] == solvedBoardCol4[8]
            || solvedBoardCol4[6] == solvedBoardCol4[7] || solvedBoardCol4[6] == solvedBoardCol4[8]
            || solvedBoardCol4[7] == solvedBoardCol4[8]
            ) 
            {
                return false;
            }


        
        let solvedBoardCol5:u8 = [solvedBoard.r1.c5, solvedBoard.r2.c5, solvedBoard.r3.c5, solvedBoard.r4.c5, solvedBoard.r5.c5, solvedBoard.r6.c5, solvedBoard.r7.c5, solvedBoard.r8.c5, solvedBoard.r9.c5];
                    //Check that the elements in this column are unique
            if(solvedBoardCol5[0] == solvedBoardCol5[1] || solvedBoardCol5[0] == solvedBoardCol5[2] || solvedBoardCol5[0] == solvedBoardCol5[3] || solvedBoardCol5[0] == solvedBoardCol5[4] || solvedBoardCol5[0] == solvedBoardCol5[5] || solvedBoardCol5[0] == solvedBoardCol5[6] || solvedBoardCol5[0] == solvedBoardCol5[7] || solvedBoardCol5[0] == solvedBoardCol5[8]
            || solvedBoardCol5[1] == solvedBoardCol5[2] || solvedBoardCol5[1] == solvedBoardCol5[3] || solvedBoardCol5[1] == solvedBoardCol5[4] || solvedBoardCol5[1] == solvedBoardCol5[5] || solvedBoardCol5[1] == solvedBoardCol5[6] || solvedBoardCol5[1] == solvedBoardCol5[7] || solvedBoardCol5[1] == solvedBoardCol5[8]
            || solvedBoardCol5[2] == solvedBoardCol5[3] || solvedBoardCol5[2] == solvedBoardCol5[4] || solvedBoardCol5[2] == solvedBoardCol5[5] || solvedBoardCol5[2] == solvedBoardCol5[6] || solvedBoardCol5[2] == solvedBoardCol5[7] || solvedBoardCol5[2] == solvedBoardCol5[8]
            || solvedBoardCol5[3] == solvedBoardCol5[4] || solvedBoardCol5[3] == solvedBoardCol5[5] || solvedBoardCol5[3] == solvedBoardCol5[6] || solvedBoardCol5[3] == solvedBoardCol5[7] || solvedBoardCol5[3] == solvedBoardCol5[8]
            || solvedBoardCol5[4] == solvedBoardCol5[5] || solvedBoardCol5[4] == solvedBoardCol5[6] || solvedBoardCol5[4] == solvedBoardCol5[7] || solvedBoardCol5[4] == solvedBoardCol5[8]
            || solvedBoardCol5[5] == solvedBoardCol5[6] || solvedBoardCol5[5] == solvedBoardCol5[7] || solvedBoardCol5[5] == solvedBoardCol5[8]
            || solvedBoardCol5[6] == solvedBoardCol5[7] || solvedBoardCol5[6] == solvedBoardCol5[8]
            || solvedBoardCol5[7] == solvedBoardCol5[8]
            ) 
            {
                return false;
            }

        let solvedBoardCol6:u8 = [solvedBoard.r1.c6, solvedBoard.r2.c6, solvedBoard.r3.c6, solvedBoard.r4.c6, solvedBoard.r5.c6, solvedBoard.r6.c6, solvedBoard.r7.c6, solvedBoard.r8.c6, solvedBoard.r9.c6];
                    //Check that the elements in this column are unique
            if(solvedBoardCol6[0] == solvedBoardCol6[1] || solvedBoardCol6[0] == solvedBoardCol6[2] || solvedBoardCol6[0] == solvedBoardCol6[3] || solvedBoardCol6[0] == solvedBoardCol6[4] || solvedBoardCol6[0] == solvedBoardCol6[5] || solvedBoardCol6[0] == solvedBoardCol6[6] || solvedBoardCol6[0] == solvedBoardCol6[7] || solvedBoardCol6[0] == solvedBoardCol6[8]
            || solvedBoardCol6[1] == solvedBoardCol6[2] || solvedBoardCol6[1] == solvedBoardCol6[3] || solvedBoardCol6[1] == solvedBoardCol6[4] || solvedBoardCol6[1] == solvedBoardCol6[5] || solvedBoardCol6[1] == solvedBoardCol6[6] || solvedBoardCol6[1] == solvedBoardCol6[7] || solvedBoardCol6[1] == solvedBoardCol6[8]
            || solvedBoardCol6[2] == solvedBoardCol6[3] || solvedBoardCol6[2] == solvedBoardCol6[4] || solvedBoardCol6[2] == solvedBoardCol6[5] || solvedBoardCol6[2] == solvedBoardCol6[6] || solvedBoardCol6[2] == solvedBoardCol6[7] || solvedBoardCol6[2] == solvedBoardCol6[8]
            || solvedBoardCol6[3] == solvedBoardCol6[4] || solvedBoardCol6[3] == solvedBoardCol6[5] || solvedBoardCol6[3] == solvedBoardCol6[6] || solvedBoardCol6[3] == solvedBoardCol6[7] || solvedBoardCol6[3] == solvedBoardCol6[8]
            || solvedBoardCol6[4] == solvedBoardCol6[5] || solvedBoardCol6[4] == solvedBoardCol6[6] || solvedBoardCol6[4] == solvedBoardCol6[7] || solvedBoardCol6[4] == solvedBoardCol6[8]
            || solvedBoardCol6[5] == solvedBoardCol6[6] || solvedBoardCol6[5] == solvedBoardCol6[7] || solvedBoardCol6[5] == solvedBoardCol6[8]
            || solvedBoardCol6[6] == solvedBoardCol6[7] || solvedBoardCol6[6] == solvedBoardCol6[8]
            || solvedBoardCol6[7] == solvedBoardCol6[8]
            ) 
            {
                return false;
            }

        
        let solvedBoardCol7:u8 = [solvedBoard.r1.c7, solvedBoard.r2.c7, solvedBoard.r3.c7, solvedBoard.r4.c7, solvedBoard.r5.c7, solvedBoard.r6.c7, solvedBoard.r7.c7, solvedBoard.r8.c7, solvedBoard.r9.c7];
                    //Check that the elements in this column are unique
            
            if(solvedBoardCol7[0] == solvedBoardCol7[1] || solvedBoardCol7[0] == solvedBoardCol7[2] || solvedBoardCol7[0] == solvedBoardCol7[3] || solvedBoardCol7[0] == solvedBoardCol7[4] || solvedBoardCol7[0] == solvedBoardCol7[5] || solvedBoardCol7[0] == solvedBoardCol7[6] || solvedBoardCol7[0] == solvedBoardCol7[7] || solvedBoardCol7[0] == solvedBoardCol7[8]
            || solvedBoardCol7[1] == solvedBoardCol7[2] || solvedBoardCol7[1] == solvedBoardCol7[3] || solvedBoardCol7[1] == solvedBoardCol7[4] || solvedBoardCol7[1] == solvedBoardCol7[5] || solvedBoardCol7[1] == solvedBoardCol7[6] || solvedBoardCol7[1] == solvedBoardCol7[7] || solvedBoardCol7[1] == solvedBoardCol7[8]
            || solvedBoardCol7[2] == solvedBoardCol7[3] || solvedBoardCol7[2] == solvedBoardCol7[4] || solvedBoardCol7[2] == solvedBoardCol7[5] || solvedBoardCol7[2] == solvedBoardCol7[6] || solvedBoardCol7[2] == solvedBoardCol7[7] || solvedBoardCol7[2] == solvedBoardCol7[8]
            || solvedBoardCol7[3] == solvedBoardCol7[4] || solvedBoardCol7[3] == solvedBoardCol7[5] || solvedBoardCol7[3] == solvedBoardCol7[6] || solvedBoardCol7[3] == solvedBoardCol7[7] || solvedBoardCol7[3] == solvedBoardCol7[8]
            || solvedBoardCol7[4] == solvedBoardCol7[5] || solvedBoardCol7[4] == solvedBoardCol7[6] || solvedBoardCol7[4] == solvedBoardCol7[7] || solvedBoardCol7[4] == solvedBoardCol7[8]
            || solvedBoardCol7[5] == solvedBoardCol7[6] || solvedBoardCol7[5] == solvedBoardCol7[7] || solvedBoardCol7[5] == solvedBoardCol7[8]
            || solvedBoardCol7[6] == solvedBoardCol7[7] || solvedBoardCol7[6] == solvedBoardCol7[8]
            || solvedBoardCol7[7] == solvedBoardCol7[8]
            ) 
            {
                return false;
            }

        let solvedBoardCol8:u8 = [solvedBoard.r1.c8, solvedBoard.r2.c8, solvedBoard.r3.c8, solvedBoard.r4.c8, solvedBoard.r5.c8, solvedBoard.r6.c8, solvedBoard.r7.c8, solvedBoard.r8.c8, solvedBoard.r9.c8];
                    //Check that the elements in this column are unique
            if(solvedBoardCol8[0] == solvedBoardCol8[1] || solvedBoardCol8[0] == solvedBoardCol8[2] || solvedBoardCol8[0] == solvedBoardCol8[3] || solvedBoardCol8[0] == solvedBoardCol8[4] || solvedBoardCol8[0] == solvedBoardCol8[5] || solvedBoardCol8[0] == solvedBoardCol8[6] || solvedBoardCol8[0] == solvedBoardCol8[7] || solvedBoardCol8[0] == solvedBoardCol8[8]
            || solvedBoardCol8[1] == solvedBoardCol8[2] || solvedBoardCol8[1] == solvedBoardCol8[3] || solvedBoardCol8[1] == solvedBoardCol8[4] || solvedBoardCol8[1] == solvedBoardCol8[5] || solvedBoardCol8[1] == solvedBoardCol8[6] || solvedBoardCol8[1] == solvedBoardCol8[7] || solvedBoardCol8[1] == solvedBoardCol8[8]
            || solvedBoardCol8[2] == solvedBoardCol8[3] || solvedBoardCol8[2] == solvedBoardCol8[4] || solvedBoardCol8[2] == solvedBoardCol8[5] || solvedBoardCol8[2] == solvedBoardCol8[6] || solvedBoardCol8[2] == solvedBoardCol8[7] || solvedBoardCol8[2] == solvedBoardCol8[8]
            || solvedBoardCol8[3] == solvedBoardCol8[4] || solvedBoardCol8[3] == solvedBoardCol8[5] || solvedBoardCol8[3] == solvedBoardCol8[6] || solvedBoardCol8[3] == solvedBoardCol8[7] || solvedBoardCol8[3] == solvedBoardCol8[8]
            || solvedBoardCol8[4] == solvedBoardCol8[5] || solvedBoardCol8[4] == solvedBoardCol8[6] || solvedBoardCol8[4] == solvedBoardCol8[7] || solvedBoardCol8[4] == solvedBoardCol8[8]
            || solvedBoardCol8[5] == solvedBoardCol8[6] || solvedBoardCol8[5] == solvedBoardCol8[7] || solvedBoardCol8[5] == solvedBoardCol8[8]
            || solvedBoardCol8[6] == solvedBoardCol8[7] || solvedBoardCol8[6] == solvedBoardCol8[8]
            || solvedBoardCol8[7] == solvedBoardCol8[8]
            ) 
            {
                return false;
            }



        let solvedBoardCol9:u8 = [solvedBoard.r1.c9, solvedBoard.r2.c9, solvedBoard.r3.c9, solvedBoard.r4.c9, solvedBoard.r5.c9, solvedBoard.r6.c9, solvedBoard.r7.c9, solvedBoard.r8.c9, solvedBoard.r9.c9];
                    //Check that the elements in this column are unique
            
            if(solvedBoardCol9[0] == solvedBoardCol9[1] || solvedBoardCol9[0] == solvedBoardCol9[2] || solvedBoardCol9[0] == solvedBoardCol9[3] || solvedBoardCol9[0] == solvedBoardCol9[4] || solvedBoardCol9[0] == solvedBoardCol9[5] || solvedBoardCol9[0] == solvedBoardCol9[6] || solvedBoardCol9[0] == solvedBoardCol9[7] || solvedBoardCol9[0] == solvedBoardCol9[8]
            || solvedBoardCol9[1] == solvedBoardCol9[2] || solvedBoardCol9[1] == solvedBoardCol9[3] || solvedBoardCol9[1] == solvedBoardCol9[4] || solvedBoardCol9[1] == solvedBoardCol9[5] || solvedBoardCol9[1] == solvedBoardCol9[6] || solvedBoardCol9[1] == solvedBoardCol9[7] || solvedBoardCol9[1] == solvedBoardCol9[8]
            || solvedBoardCol9[2] == solvedBoardCol9[3] || solvedBoardCol9[2] == solvedBoardCol9[4] || solvedBoardCol9[2] == solvedBoardCol9[5] || solvedBoardCol9[2] == solvedBoardCol9[6] || solvedBoardCol9[2] == solvedBoardCol9[7] || solvedBoardCol9[2] == solvedBoardCol9[8]
            || solvedBoardCol9[3] == solvedBoardCol9[4] || solvedBoardCol9[3] == solvedBoardCol9[5] || solvedBoardCol9[3] == solvedBoardCol9[6] || solvedBoardCol9[3] == solvedBoardCol9[7] || solvedBoardCol9[3] == solvedBoardCol9[8]
            || solvedBoardCol9[4] == solvedBoardCol9[5] || solvedBoardCol9[4] == solvedBoardCol9[6] || solvedBoardCol9[4] == solvedBoardCol9[7] || solvedBoardCol9[4] == solvedBoardCol9[8]
            || solvedBoardCol9[5] == solvedBoardCol9[6] || solvedBoardCol9[5] == solvedBoardCol9[7] || solvedBoardCol9[5] == solvedBoardCol9[8]
            || solvedBoardCol9[6] == solvedBoardCol9[7] || solvedBoardCol9[6] == solvedBoardCol9[8]
            || solvedBoardCol9[7] == solvedBoardCol9[8]
            ) 
            {
                return false;
            }

        // Check that every nonet has unique numbers 1-9 and not repeated\

        let 
        



                    
                


       



       
      



        
        




















        
        return true;
        }


}