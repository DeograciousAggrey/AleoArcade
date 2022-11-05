// The 'skyscrapers' program.
program skyscrapers.aleo {
    // A row in a Skyscrapers board
    // - `c1` : The first entry in the row.
    // - `c2` : The second entry in the row.
    // - `c3` : The third entry in the row.
    // - `c4` : The fourth entry in the row.
    // - `c5` : The fifth entry in the row.
    struct Row {
        c1: u8,
        c2: u8,
        c3: u8,
        c4: u8,
        c5: u8,
    }

    // A Skyscrapers board
    // - `r1` : The first row in the board.
    // - `r2` : The second row in the board.
    // - `r3` : The third row in the board.
    // - `r4` : The fourth row in the board.
    // - `r5` : The fifth row in the board.
    struct Board {
        r1: Row,
        r2: Row,
        r3: Row,
        r4: Row,
        r5: Row,
    }

    // Returns an empty board.
    transition empty_board() -> Board {
        return Board {
            r1: Row {
                c1: 0u8,
                c2: 0u8,
                c3: 0u8,
                c4: 0u8,
                c5: 0u8,
            },
            r2: Row {
                c1: 0u8,
                c2: 0u8,
                c3: 0u8,
                c4: 0u8,
                c5: 0u8,
            },
            r3: Row {
                c1: 0u8,
                c2: 0u8,
                c3: 0u8,
                c4: 0u8,
                c5: 0u8,
            },
            r4: Row {
                c1: 0u8,
                c2: 0u8,
                c3: 0u8,
                c4: 0u8,
                c5: 0u8,
            },
            r5: Row {
                c1: 0u8,
                c2: 0u8,
                c3: 0u8,
                c4: 0u8,
                c5: 0u8,
            },
        };

            }
        
    // Returns a solved board.
    transition solved_board() -> Board {
        return Board {
            r1: Row{ c1: 1u8, c2: 2u8, c3: 4u8, c4: 5u8, c5: 3u8 },
            r2: Row{ c1: 2u8, c2: 3u8, c3: 1u8, c4: 4u8, c5: 5u8 },
            r3: Row{c1: 5u8, c2: 4u8, c3: 3u8, c4: 2u8, c5: 1u8 },
            r4: Row{ c1: 3u8, c2: 5u8, c3: 2u8, c4: 1u8, c5: 4u8 },
            r5: Row{ c1: 4u8, c2: 1u8, c3: 5u8, c4: 3u8, c5: 2u8 },
        };  
    }

    // List of Skyscrapers amounts in the order: left, right, top, bottom.(Rows then columns and if there is no clue, the amount is 0)
    // - `l1` : The first amount in the list.
    // - `l2` : The second amount in the list.
    // - `l3` : The third amount in the list.
    // - `l4` : The fourth amount in the list.
    // - `l5` : The fifth amount in the list.
    // - `l6` : The sixth amount in the list.
    // - `l7` : The seventh amount in the list.
    // - `l8` : The eighth amount in the list.
    // - `l9` : The ninth amount in the list.
    // - `l10` : The tenth amount in the list.
    // - `l11` : The eleventh amount in the list.
    // - `l12` : The twelfth amount in the list.
    // - `l13` : The thirteenth amount in the list.
    // - `l14` : The fourteenth amount in the list.
    // - `l15` : The fifteenth amount in the list.
    // - `l16` : The sixteenth amount in the list.
    // - `l17` : The seventeenth amount in the list.
    // - `l18` : The eighteenth amount in the list.
    // - `l19` : The nineteenth amount in the list.
    // - `l20` : The twentieth amount in the list.
    struct Clues {
        l1: u8,
        l2: u8,
        l3: u8,
        l4: u8,
        l5: u8,
        l6: u8,
        l7: u8,
        l8: u8,
        l9: u8,
        l10: u8,
        l11: u8,
        l12: u8,
        l13: u8,
        l14: u8,
        l15: u8,
        l16: u8,
        l17: u8,
        l18: u8,
        l19: u8,
        l20: u8,
    }

    // Check if the values of solved skyscrapers are >= 1 and <= 5.

    function check_values(board: Board) -> bool {
        return 
           ( board.r1.c1 >= 1u8 && board.r1.c1 <= 5u8 &&
            board.r1.c2 >= 1u8 && board.r1.c2 <= 5u8 &&
            board.r1.c3 >= 1u8 && board.r1.c3 <= 5u8 &&
            board.r1.c4 >= 1u8 && board.r1.c4 <= 5u8 &&
            board.r1.c5 >= 1u8 && board.r1.c5 <= 5u8 &&
            board.r2.c1 >= 1u8 && board.r2.c1 <= 5u8 &&
            board.r2.c2 >= 1u8 && board.r2.c2 <= 5u8 &&
            board.r2.c3 >= 1u8 && board.r2.c3 <= 5u8 &&
            board.r2.c4 >= 1u8 && board.r2.c4 <= 5u8 &&
            board.r2.c5 >= 1u8 && board.r2.c5 <= 5u8 &&
            board.r3.c1 >= 1u8 && board.r3.c1 <= 5u8 &&
            board.r3.c2 >= 1u8 && board.r3.c2 <= 5u8 &&
            board.r3.c3 >= 1u8 && board.r3.c3 <= 5u8 &&
            board.r3.c4 >= 1u8 && board.r3.c4 <= 5u8 &&
            board.r3.c5 >= 1u8 && board.r3.c5 <= 5u8 &&
            board.r4.c1 >= 1u8 && board.r4.c1 <= 5u8 &&
            board.r4.c2 >= 1u8 && board.r4.c2 <= 5u8 &&
            board.r4.c3 >= 1u8 && board.r4.c3 <= 5u8 &&
            board.r4.c4 >= 1u8 && board.r4.c4 <= 5u8 &&
            board.r4.c5 >= 1u8 && board.r4.c5 <= 5u8 &&
            board.r5.c1 >= 1u8 && board.r5.c1 <= 5u8 &&
            board.r5.c2 >= 1u8 && board.r5.c2 <= 5u8 &&
            board.r5.c3 >= 1u8 && board.r5.c3 <= 5u8 &&
            board.r5.c4 >= 1u8 && board.r5.c4 <= 5u8 &&
            board.r5.c5 >= 1u8 && board.r5.c5 <= 5u8 );

        
    }

    // Check if every row in solved board has the numbers 1 to 5.
    // For each element in the row, check if it is not equal to any other element in the row.
    // 50 = (1+2+3+4) * 5 (Components )

     

   















    //Check if each column in solved has the numbers 1-5
    // For each element in the column, check if it is equal to the sum of the other elements in the column
    // 50 = ()







}
