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

    // List of Skyscrapers clue amounts in the order: left, right, top, bottom.(Rows then columns and if there is no clue, the amount is 0)
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
        l1: 2u8,
        l2: 2u8,
        l3: 3u8,
        l4: 4u8,
        l5: 1u8,
        l6: 2u8,
        l7: 3u8,
        l8: 1u8,    
        l9: 2u8,
        l10: 3u8,
        l11: 3u8,
        l12: 2u8,
        l13: 1u8,
        l14: 3u8,
        l15: 2u8,
        l16: 1u8,
        l17: 4u8,
        l18: 3u8,
        l19: 2u8,
        l20: 2u8,
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
    // there are 50 comparisons in total.
    function check_rows(board: Board) -> bool {
        return 
            (board.r1.c1 != board.r1.c2 && board.r1.c1 != board.r1.c3 && board.r1.c1 != board.r1.c4 && board.r1.c1 != board.r1.c5 &&
            board.r1.c2 != board.r1.c3 && board.r1.c2 != board.r1.c4 && board.r1.c2 != board.r1.c5 &&
            board.r1.c3 != board.r1.c4 && board.r1.c3 != board.r1.c5 &&
            board.r1.c4 != board.r1.c5 &&
            board.r2.c1 != board.r2.c2 && board.r2.c1 != board.r2.c3 && board.r2.c1 != board.r2.c4 && board.r2.c1 != board.r2.c5 &&
            board.r2.c2 != board.r2.c3 && board.r2.c2 != board.r2.c4 && board.r2.c2 != board.r2.c5 &&
            board.r2.c3 != board.r2.c4 && board.r2.c3 != board.r2.c5 &&
            board.r2.c4 != board.r2.c5 &&
            board.r3.c1 != board.r3.c2 && board.r3.c1 != board.r3.c3 && board.r3.c1 != board.r3.c4 && board.r3.c1 != board.r3.c5 &&
            board.r3.c2 != board.r3.c3 && board.r3.c2 != board.r3.c4 && board.r3.c2 != board.r3.c5 &&
            board.r3.c3 != board.r3.c4 && board.r3.c3 != board.r3.c5 &&
            board.r3.c4 != board.r3.c5 &&
            board.r4.c1 != board.r4.c2 && board.r4.c1 != board.r4.c3 && board.r4.c1 != board.r4.c4 && board.r4.c1 != board.r4.c5 &&
            board.r4.c2 != board.r4.c3 && board.r4.c2 != board.r4.c4 && board.r4.c2 != board.r4.c5 &&
            board.r4.c3 != board.r4.c4 && board.r4.c3 != board.r4.c5 && board.r4.c4 != board.r4.c5 &&
            board.r5.c1 != board.r5.c2 && board.r5.c1 != board.r5.c3 && board.r5.c1 != board.r5.c4 && board.r5.c1 != board.r5.c5 &&
            board.r5.c2 != board.r5.c3 && board.r5.c2 != board.r5.c4 && board.r5.c2 != board.r5.c5 &&
            board.r5.c3 != board.r5.c4 && board.r5.c3 != board.r5.c5 && board.r5.c4 != board.r5.c5);
    }


    // Check if every column in solved board has the numbers 1 to 5.
    // For each element in the column, check if it is not equal to any other element in the column.
    // there are 50 comparisons in total.
    function check_columns(board: Board) -> bool {
        return 
            (board.r1.c1 != board.r2.c1 && board.r1.c1 != board.r3.c1 && board.r1.c1 != board.r4.c1 && board.r1.c1 != board.r5.c1 &&
            board.r2.c1 != board.r3.c1 && board.r2.c1 != board.r4.c1 && board.r2.c1 != board.r5.c1 &&
            board.r3.c1 != board.r4.c1 && board.r3.c1 != board.r5.c1 &&
            board.r4.c1 != board.r5.c1 &&
            board.r1.c2 != board.r2.c2 && board.r1.c2 != board.r3.c2 && board.r1.c2 != board.r4.c2 && board.r1.c2 != board.r5.c2 &&
            board.r2.c2 != board.r3.c2 && board.r2.c2 != board.r4.c2 && board.r2.c2 != board.r5.c2 &&
            board.r3.c2 != board.r4.c2 && board.r3.c2 != board.r5.c2 &&
            board.r4.c2 != board.r5.c2 &&
            board.r1.c3 != board.r2.c3 && board.r1.c3 != board.r3.c3 && board.r1.c3 != board.r4.c3 && board.r1.c3 != board.r5.c3 &&
            board.r2.c3 != board.r3.c3 && board.r2.c3 != board.r4.c3 && board.r2.c3 != board.r5.c3 &&
            board.r3.c3 != board.r4.c3 && board.r3.c3 != board.r5.c3 &&
            board.r4.c3 != board.r5.c3 &&
            board.r1.c4 != board.r2.c4 && board.r1.c4 != board.r3.c4 && board.r1.c4 != board.r4.c4 && board.r1.c4 != board.r5.c4 &&
            board.r2.c4 != board.r3.c4 && board.r2.c4 != board.r4.c4 && board.r2.c4 != board.r5.c4 &&
            board.r3.c4 != board.r4.c4 && board.r3.c4 != board.r5.c4 && board.r4.c4 != board.r5.c4 &&
            board.r1.c5 != board.r2.c5 && board.r1.c5 != board.r3.c5 && board.r1.c5 != board.r4.c5 && board.r1.c5 != board.r5.c5 &&
            board.r2.c5 != board.r3.c5 && board.r2.c5 != board.r4.c5 && board.r2.c5 != board.r5.c5 &&
            board.r3.c5 != board.r4.c5 && board.r3.c5 != board.r5.c5 && board.r4.c5 != board.r5.c5);
    }

    // Check Skyscrapers amount 
    

    // Check the left skyscrapers amount(From left to right). 
    // Given the clues from l1 to l5, check if the amount of skyscrapers that can be seen from the left satisfies the rules of the game.
    // For each row, check if the amount of skyscrapers that can be seen from the left is equal to the clue.
    // How many values are bigger than the highest value in the row from the left to right from column 1 to 5.
    //If the amount of skyscrapers that can be seen from the left is equal to the clue, return true.
    // If the amount of skyscrapers that can be seen from the left is not equal to the clue, return false.
    function check_left_skyscrapers(board: Board, clues: Clues) -> bool {
        return 
            (board.r1.c1 > board.r1.c2 && board.r1.c1 > board.r1.c3 && board.r1.c1 > board.r1.c4 && board.r1.c1 > board.r1.c5 && clues.l1 == 1u8 ||
            board.r1.c1 > board.r1.c2 && board.r1.c1 > board.r1.c3 && board.r1.c1 > board.r1.c4 && clues.l1 == 2u8 ||
            board.r1.c1 > board.r1.c2 && board.r1.c1 > board.r1.c3 && clues.l1 == 3u8 ||
            board.r1.c1 > board.r1.c2 && clues.l1 == 4u8 ||
            clues.l1 == 5u8) &&
            (board.r2.c1 > board.r2.c2 && board.r2.c1 > board.r2.c3 && board.r2.c1 > board.r2.c4 && board.r2.c1 > board.r2.c5 && clues.l2 == 1u8 ||
            board.r2.c1 > board.r2.c2 && board.r2.c1 > board.r2.c3 && board.r2.c1 > board.r2.c4 && clues.l2 == 2u8 ||
            board.r2.c1 > board.r2.c2 && board.r2.c1 > board.r2.c3 && clues.l2 == 3u8 ||
            board.r2.c1 > board.r2.c2 && clues.l2 == 4u8 ||
            clues.l2 == 5u8) &&
            (board.r3.c1 > board.r3.c2 && board.r3.c1 > board.r3.c3 && board.r3.c1 > board.r3.c4 && board.r3.c1 > board.r3.c5 && clues.l3 == 1u8 ||
            board.r3.c1 > board.r3.c2 && board.r3.c1 > board.r3.c3 && board.r3.c1 > board.r3.c4 && clues.l3 == 2u8 ||
            board.r3.c1 > board.r3.c2 && board.r3.c1 > board.r3.c3 && clues.l3 == 3u8 ||
            board.r3.c1 > board.r3.c2 && clues.l3 == 4u8 ||
            clues.l3 == 5u8) &&
            (board.r4.c1 > board.r4.c2 && board.r4.c1 > board.r4.c3 && board.r4.c1 > board.r4.c4 && board.r4.c1 > board.r4.c5 && clues.l4 == 1u8 ||
            board.r4.c1 > board.r4.c2 && board.r4.c1 > board.r4.c3 && board.r4.c1 > board.r4.c4 && clues.l4 == 2u8 ||
            board.r4.c1 > board.r4.c2 && board.r4.c1 > board.r4.c3 && clues.l4 == 3u8 ||
            board.r4.c1 > board.r4.c2 && clues.l4 == 4u8 ||
            clues.l4 == 5u8) &&
            (board.r5.c1 > board.r5.c2 && board.r5.c1 > board.r5.c3 && board.r5.c1 > board.r5.c4 && board.r5.c1 > board.r5.c5 && clues.l5 == 1u8 ||
            board.r5.c1 > board.r5.c2 && board.r5.c1 > board.r5.c3 && board.r5.c1 > board.r5.c4 && clues.l5 == 2u8 ||
            board.r5.c1 > board.r5.c2 && board.r5.c1 > board.r5.c3 && clues.l5 == 3u8 ||
            board.r5.c1 > board.r5.c2 && clues.l5 == 4u8 ||
            clues.l5 == 5u8);
    }


    // Check the right skyscrapers amount(From right to left).
    // Given the clues from l6 to l10, check if the amount of skyscrapers that can be seen from the right satisfies the rules of the game.
    // For each row, check if the amount of skyscrapers that can be seen from the right is equal to the clue.
    // How many values are bigger than the highest value in the row from the right to left from column 1 to 5.
    //If the amount of skyscrapers that can be seen from the right is equal to the clue, return true.
    // If the amount of skyscrapers that can be seen from the right is not equal to the clue, return false.
    function check_right_skyscrapers(board: Board, clues: Clues) -> bool {
        return 
            (board.r1.c5 > board.r1.c4 && board.r1.c5 > board.r1.c3 && board.r1.c5 > board.r1.c2 && board.r1.c5 > board.r1.c1 && clues.l6 == 1u8 ||
            board.r1.c5 > board.r1.c4 && board.r1.c5 > board.r1.c3 && board.r1.c5 > board.r1.c2 && clues.l6 == 2u8 ||
            board.r1.c5 > board.r1.c4 && board.r1.c5 > board.r1.c3 && clues.l6 == 3u8 ||
            board.r1.c5 > board.r1.c4 && clues.l6 == 4u8 ||
            clues.l6 == 5u8) &&
            (board.r2.c5 > board.r2.c4 && board.r2.c5 > board.r2.c3 && board.r2.c5 > board.r2.c2 && board.r2.c5 > board.r2.c1 && clues.l7 == 1u8 ||
            board.r2.c5 > board.r2.c4 && board.r2.c5 > board.r2.c3 && board.r2.c5 > board.r2.c2 && clues.l7 == 2u8 ||
            board.r2.c5 > board.r2.c4 && board.r2.c5 > board.r2.c3 && clues.l7 == 3u8 ||
            board.r2.c5 > board.r2.c4 && clues.l7 == 4u8 ||
            clues.l7 == 5u8) &&
            (board.r3.c5 > board.r3.c4 && board.r3.c5 > board.r3.c3 && board.r3.c5 > board.r3.c2 && board.r3.c5 > board.r3.c1 && clues.l8 == 1u8 ||
            board.r3.c5 > board.r3.c4 && board.r3.c5 > board.r3.c3 && board.r3.c5 > board.r3.c2 && clues.l8 == 2u8 ||
            board.r3.c5 > board.r3.c4 && board.r3.c5 > board.r3.c3 && clues.l8 == 3u8 ||
            board.r3.c5 > board.r3.c4 && clues.l8 == 4u8 ||
            clues.l8 == 5u8) &&
            (board.r4.c5 > board.r4.c4 && board.r4.c5 > board.r4.c3 && board.r4.c5 > board.r4.c2 && board.r4.c5 > board.r4.c1 && clues.l9 == 1u8 ||
            board.r4.c5 > board.r4.c4 && board.r4.c5 > board.r4.c3 && board.r4.c5 > board.r4.c2 && clues.l9 == 2u8 ||
            board.r4.c5 > board.r4.c4 && board.r4.c5 > board.r4.c3 && clues.l9 == 3u8 ||
            board.r4.c5 > board.r4.c4 && clues.l9 == 4u8 ||
            clues.l9 == 5u8) &&
            (board.r5.c5 > board.r5.c4 && board.r5.c5 > board.r5.c3 && board.r5.c5 > board.r5.c2 && board.r5.c5 > board.r5.c1 && clues.l10 == 1u8 ||
            board.r5.c5 > board.r5.c4 && board.r5.c5 > board.r5.c3 && board.r5.c5 > board.r5.c2 && clues.l10 == 2u8 ||
            board.r5.c5 > board.r5.c4 && board.r5.c5 > board.r5.c3 && clues.l10 == 3u8 ||
            board.r5.c5 > board.r5.c4 && clues.l10 == 4u8 ||
            clues.l10 == 5u8);
    }


    // Check the top skyscrapers amount(From top to bottom).
    // Given the clues from l11 to l15, check if the amount of skyscrapers that can be seen from the top satisfies the rules of the game.
    // For each column, check if the amount of skyscrapers that can be seen from the top is equal to the clue.
    // How many values are bigger than the highest value in the column from the top to bottom from row 1 to 5.
    //If the amount of skyscrapers that can be seen from the top is equal to the clue, return true.
    // If the amount of skyscrapers that can be seen from the top is not equal to the clue, return false.
    function check_top_skyscrapers(board: Board, clues: Clues) -> bool {
        return 
            (board.r1.c1 > board.r2.c1 && board.r1.c1 > board.r3.c1 && board.r1.c1 > board.r4.c1 && board.r1.c1 > board.r5.c1 && clues.l11 == 1u8 ||
            board.r1.c1 > board.r2.c1 && board.r1.c1 > board.r3.c1 && board.r1.c1 > board.r4.c1 && clues.l11 == 2u8 ||
            board.r1.c1 > board.r2.c1 && board.r1.c1 > board.r3.c1 && clues.l11 == 3u8 ||
            board.r1.c1 > board.r2.c1 && clues.l11 == 4u8 ||
            clues.l11 == 5u8) &&
            (board.r1.c2 > board.r2.c2 && board.r1.c2 > board.r3.c2 && board.r1.c2 > board.r4.c2 && board.r1.c2 > board.r5.c2 && clues.l12 == 1u8 ||
            board.r1.c2 > board.r2.c2 && board.r1.c2 > board.r3.c2 && board.r1.c2 > board.r4.c2 && clues.l12 == 2u8 ||
            board.r1.c2 > board.r2.c2 && board.r1.c2 > board.r3.c2 && clues.l12 == 3u8 ||
            board.r1.c2 > board.r2.c2 && clues.l12 == 4u8 ||
            clues.l12 == 5u8) &&
            (board.r1.c3 > board.r2.c3 && board.r1.c3 > board.r3.c3 && board.r1.c3 > board.r4.c3 && board.r1.c3 > board.r5.c3 && clues.l13 == 1u8 ||
            board.r1.c3 > board.r2.c3 && board.r1.c3 > board.r3.c3 && board.r1.c3 > board.r4.c3 && clues.l13 == 2u8 ||
            board.r1.c3 > board.r2.c3 && board.r1.c3 > board.r3.c3 && clues.l13 == 3u8 ||
            board.r1.c3 > board.r2.c3 && clues.l13 == 4u8 ||
            clues.l13 == 5u8) &&
            (board.r1.c4 > board.r2.c4 && board.r1.c4 > board.r3.c4 && board.r1.c4 > board.r4.c4 && board.r1.c4 > board.r5.c4 && clues.l14 == 1u8 ||
            board.r1.c4 > board.r2.c4 && board.r1.c4 > board.r3.c4 && board.r1.c4 > board.r4.c4 && clues.l14 == 2u8 ||
            board.r1.c4 > board.r2.c4 && board.r1.c4 > board.r3.c4 && clues.l14 == 3u8 ||
            board.r1.c4 > board.r2.c4 && clues.l14 == 4u8 ||
            clues.l14 == 5u8) &&
            (board.r1.c5 > board.r2.c5 && board.r1.c5 > board.r3.c5 && board.r1.c5 > board.r4.c5 && board.r1.c5 > board.r5.c5 && clues.l15 == 1u8 ||
            board.r1.c5 > board.r2.c5 && board.r1.c5 > board.r3.c5 && board.r1.c5 > board.r4.c5 && clues.l15 == 2u8 ||
            board.r1.c5 > board.r2.c5 && board.r1.c5 > board.r3.c5 && clues.l15 == 3u8 ||
            board.r1.c5 > board.r2.c5 && clues.l15 == 4u8 ||
            clues.l15 == 5u8);
    }


    // Check the bottom skyscrapers amount(From bottom to top).
    // Given the clues from l16 to l20, check if the amount of skyscrapers that can be seen from the bottom satisfies the rules of the game.
    // For each column, check if the amount of skyscrapers that can be seen from the bottom is equal to the clue.
    // How many values are bigger than the highest value in the column from the bottom to top from row 1 to 5.
    //If the amount of skyscrapers that can be seen from the bottom is equal to the clue, return true.
    // If the amount of skyscrapers that can be seen from the bottom is not equal to the clue, return false.
    function check_bottom_skyscrapers(board: Board, clues: Clues) -> bool {
        return 
            (board.r5.c1 > board.r4.c1 && board.r5.c1 > board.r3.c1 && board.r5.c1 > board.r2.c1 && board.r5.c1 > board.r1.c1 && clues.l16 == 1u8 ||
            board.r5.c1 > board.r4.c1 && board.r5.c1 > board.r3.c1 && board.r5.c1 > board.r2.c1 && clues.l16 == 2u8 ||
            board.r5.c1 > board.r4.c1 && board.r5.c1 > board.r3.c1 && clues.l16 == 3u8 ||
            board.r5.c1 > board.r4.c1 && clues.l16 == 4u8 ||
            clues.l16 == 5u8) &&
            (board.r5.c2 > board.r4.c2 && board.r5.c2 > board.r3.c2 && board.r5.c2 > board.r2.c2 && board.r5.c2 > board.r1.c2 && clues.l17 == 1u8 ||
            board.r5.c2 > board.r4.c2 && board.r5.c2 > board.r3.c2 && board.r5.c2 > board.r2.c2 && clues.l17 == 2u8 ||
            board.r5.c2 > board.r4.c2 && board.r5.c2 > board.r3.c2 && clues.l17 == 3u8 ||
            board.r5.c2 > board.r4.c2 && clues.l17 == 4u8 ||
            clues.l17 == 5u8) &&
            (board.r5.c3 > board.r4.c3 && board.r5.c3 > board.r3.c3 && board.r5.c3 > board.r2.c3 && board.r5.c3 > board.r1.c3 && clues.l18 == 1u8 ||
            board.r5.c3 > board.r4.c3 && board.r5.c3 > board.r3.c3 && board.r5.c3 > board.r2.c3 && clues.l18 == 2u8 ||
            board.r5.c3 > board.r4.c3 && board.r5.c3 > board.r3.c3 && clues.l18 == 3u8 ||
            board.r5.c3 > board.r4.c3 && clues.l18 == 4u8 ||
            clues.l18 == 5u8) &&
            (board.r5.c4 > board.r4.c4 && board.r5.c4 > board.r3.c4 && board.r5.c4 > board.r2.c4 && board.r5.c4 > board.r1.c4 && clues.l19 == 1u8 ||
            board.r5.c4 > board.r4.c4 && board.r5.c4 > board.r3.c4 && board.r5.c4 > board.r2.c4 && clues.l19 == 2u8 ||
            board.r5.c4 > board.r4.c4 && board.r5.c4 > board.r3.c4 && clues.l19 == 3u8 ||
            board.r5.c4 > board.r4.c4 && clues.l19 == 4u8 ||
            clues.l19 == 5u8) &&
            (board.r5.c5 > board.r4.c5 && board.r5.c5 > board.r3.c5 && board.r5.c5 > board.r2.c5 && board.r5.c5 > board.r1.c5 && clues.l20 == 1u8 ||
            board.r5.c5 > board.r4.c5 && board.r5.c5 > board.r3.c5 && board.r5.c5 > board.r2.c5 && clues.l20 == 2u8 ||
            board.r5.c5 > board.r4.c5 && board.r5.c5 > board.r3.c5 && clues.l20 == 3u8 ||
            board.r5.c5 > board.r4.c5 && clues.l20 == 4u8 ||
            clues.l20 == 5u8);
    }

    




     

   
















}
