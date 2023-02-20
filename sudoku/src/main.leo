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

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow1[i] == solvedBoardRow1[j] {
                            return false;
                        }
                    }
                }
            }
            
            
            













        let solvedBoardRow2:u8 = [solvedBoard.r2.c1, solvedBoard.r2.c2, solvedBoard.r2.c3, solvedBoard.r2.c4, solvedBoard.r2.c5, solvedBoard.r2.c6, solvedBoard.r2.c7, solvedBoard.r2.c8, solvedBoard.r2.c9];
                //Check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow2[i] == solvedBoardRow2[j] {
                            return false;
                        }
                    }
                }
            }





        let solvedBoardRow3:u8 = [solvedBoard.r3.c1, solvedBoard.r3.c2, solvedBoard.r3.c3, solvedBoard.r3.c4, solvedBoard.r3.c5, solvedBoard.r3.c6, solvedBoard.r3.c7, solvedBoard.r3.c8, solvedBoard.r3.c9];

                //Check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow3[i] == solvedBoardRow3[j] {
                            return false;
                        }
                    }
                }
            }



        let solvedBoardRow4:u8 = [solvedBoard.r4.c1, solvedBoard.r4.c2, solvedBoard.r4.c3, solvedBoard.r4.c4, solvedBoard.r4.c5, solvedBoard.r4.c6, solvedBoard.r4.c7, solvedBoard.r4.c8, solvedBoard.r4.c9];

                //Check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow4[i] == solvedBoardRow4[j] {
                            return false;
                        }
                    }
                }
            }


        let solvedBoardRow5:u8 = [solvedBoard.r5.c1, solvedBoard.r5.c2, solvedBoard.r5.c3, solvedBoard.r5.c4, solvedBoard.r5.c5, solvedBoard.r5.c6, solvedBoard.r5.c7, solvedBoard.r5.c8, solvedBoard.r5.c9];


                //Check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow5[i] == solvedBoardRow5[j] {
                            return false;
                        }
                    }
                }
            }



        let solvedBoardRow6:u8 = [solvedBoard.r6.c1, solvedBoard.r6.c2, solvedBoard.r6.c3, solvedBoard.r6.c4, solvedBoard.r6.c5, solvedBoard.r6.c6, solvedBoard.r6.c7, solvedBoard.r6.c8, solvedBoard.r6.c9];


                //Check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow6[i] == solvedBoardRow6[j] {
                            return false;
                        }
                    }
                }
            }



        let solvedBoardRow7:u8 = [solvedBoard.r7.c1, solvedBoard.r7.c2, solvedBoard.r7.c3, solvedBoard.r7.c4, solvedBoard.r7.c5, solvedBoard.r7.c6, solvedBoard.r7.c7, solvedBoard.r7.c8, solvedBoard.r7.c9];

                // check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow7[i] == solvedBoardRow7[j] {
                            return false;
                        }
                    }
                }
            }





        let solvedBoardRow8:u8 = [solvedBoard.r8.c1, solvedBoard.r8.c2, solvedBoard.r8.c3, solvedBoard.r8.c4, solvedBoard.r8.c5, solvedBoard.r8.c6, solvedBoard.r8.c7, solvedBoard.r8.c8, solvedBoard.r8.c9];

                //Check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow8[i] == solvedBoardRow8[j] {
                            return false;
                        }
                    }
                }
            }




        let solvedBoardRow9:u8 = [solvedBoard.r9.c1, solvedBoard.r9.c2, solvedBoard.r9.c3, solvedBoard.r9.c4, solvedBoard.r9.c5, solvedBoard.r9.c6, solvedBoard.r9.c7, solvedBoard.r9.c8, solvedBoard.r9.c9];

                //Check that the elements in this row are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardRow9[i] == solvedBoardRow9[j] {
                            return false;
                        }
                    }
                }
            }






        let solvedBoardCol1:u8 = [solvedBoard.r1.c1, solvedBoard.r2.c1, solvedBoard.r3.c1, solvedBoard.r4.c1, solvedBoard.r5.c1, solvedBoard.r6.c1, solvedBoard.r7.c1, solvedBoard.r8.c1, solvedBoard.r9.c1];

                //Check that the elements in this column are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardCol1[i] == solvedBoardCol1[j] {
                            return false;
                        }
                    }
                }
            }

        
        let solvedBoardCol2:u8 = [solvedBoard.r1.c2, solvedBoard.r2.c2, solvedBoard.r3.c2, solvedBoard.r4.c2, solvedBoard.r5.c2, solvedBoard.r6.c2, solvedBoard.r7.c2, solvedBoard.r8.c2, solvedBoard.r9.c2];

                //Check that the elements in this column are unique

            for i: u8 in 0u8..8u8 {
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardCol2[i] == solvedBoardCol2[j] {
                            return false;
                        }
                    }
                }
            }



        let solvedBoardCol3:u8 = [solvedBoard.r1.c3, solvedBoard.r2.c3, solvedBoard.r3.c3, solvedBoard.r4.c3, solvedBoard.r5.c3, solvedBoard.r6.c3, solvedBoard.r7.c3, solvedBoard.r8.c3, solvedBoard.r9.c3];

                //Check that the elements in this column are unique

            for i: u8 in 0u8..8u8 { 
                for j: u8 in 0u8..8u8 {
                    if i != j {
                        if solvedBoardCol3[i] == solvedBoardCol3[j] {
                            return false;
                        }
                    }
                }
            }
        
        let solvedBoardCol4:u8 = [solvedBoard.r1.c4, solvedBoard.r2.c4, solvedBoard.r3.c4, solvedBoard.r4.c4, solvedBoard.r5.c4, solvedBoard.r6.c4, solvedBoard.r7.c4, solvedBoard.r8.c4, solvedBoard.r9.c4];
                    //Check that the elements in this column are unique
                for i: u8 in 0u8..8u8 {
                    for j: u8 in 0u8..8u8 {
                        if i != j {
                            if solvedBoardCol4[i] == solvedBoardCol4[j] {
                                return false;
                            }
                        }
                    }
                }
        
        let solvedBoardCol5:u8 = [solvedBoard.r1.c5, solvedBoard.r2.c5, solvedBoard.r3.c5, solvedBoard.r4.c5, solvedBoard.r5.c5, solvedBoard.r6.c5, solvedBoard.r7.c5, solvedBoard.r8.c5, solvedBoard.r9.c5];
                    //Check that the elements in this column are unique
                for i: u8 in 0u8..8u8 {
                    for j: u8 in 0u8..8u8 {
                        if i != j {
                            if solvedBoardCol5[i] == solvedBoardCol5[j] {
                                return false;
                            }
                        }
                    }
                }

        let solvedBoardCol6:u8 = [solvedBoard.r1.c6, solvedBoard.r2.c6, solvedBoard.r3.c6, solvedBoard.r4.c6, solvedBoard.r5.c6, solvedBoard.r6.c6, solvedBoard.r7.c6, solvedBoard.r8.c6, solvedBoard.r9.c6];
                    //Check that the elements in this column are unique
                for i: u8 in 0u8..8u8 {
                    for j: u8 in 0u8..8u8 {
                        if i != j {
                            if solvedBoardCol6[i] == solvedBoardCol6[j] {
                                return false;
                            }
                        }
                    }
                }
        
        let solvedBoardCol7:u8 = [solvedBoard.r1.c7, solvedBoard.r2.c7, solvedBoard.r3.c7, solvedBoard.r4.c7, solvedBoard.r5.c7, solvedBoard.r6.c7, solvedBoard.r7.c7, solvedBoard.r8.c7, solvedBoard.r9.c7];
                    //Check that the elements in this column are unique
                for i: u8 in 0u8..8u8 {
                    for j: u8 in 0u8..8u8 {
                        if i != j {
                            if solvedBoardCol7[i] == solvedBoardCol7[j] {
                                return false;
                            }
                        }
                    }
                }

        let solvedBoardCol8:u8 = [solvedBoard.r1.c8, solvedBoard.r2.c8, solvedBoard.r3.c8, solvedBoard.r4.c8, solvedBoard.r5.c8, solvedBoard.r6.c8, solvedBoard.r7.c8, solvedBoard.r8.c8, solvedBoard.r9.c8];
                    //Check that the elements in this column are unique
                for i: u8 in 0u8..8u8 {
                    for j: u8 in 0u8..8u8 {
                        if i != j {
                            if solvedBoardCol8[i] == solvedBoardCol8[j] {
                                return false;
                            }
                        }
                    }
                }



        let solvedBoardCol9:u8 = [solvedBoard.r1.c9, solvedBoard.r2.c9, solvedBoard.r3.c9, solvedBoard.r4.c9, solvedBoard.r5.c9, solvedBoard.r6.c9, solvedBoard.r7.c9, solvedBoard.r8.c9, solvedBoard.r9.c9];
                    //Check that the elements in this column are unique
                for i: u8 in 0u8..8u8 {
                    for j: u8 in 0u8..8u8 {
                        if i != j {
                            if solvedBoardCol9[i] == solvedBoardCol9[j] {
                                return false;
                            }
                        }
                    }
                }

        
                    
                


       



       
      



        
        




















        
        return true;
        }


}