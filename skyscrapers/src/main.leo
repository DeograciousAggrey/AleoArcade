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
            r1: Row{ c1: 3u8, c2: 1u8, c3: 5u8, c4: 2u8, c5: 4u8 },
            r2: Row{ c1: 4u8, c2: 5u8, c3: 2u8, c4: 3u8, c5: 1u8 },
            r3: Row{c1: 2u8, c2: 4u8, c3: 3u8, c4: 1u8, c5: 5u8 },
            r4: Row{ c1: 1u8, c2: 3u8, c3: 4u8, c4: 5u8, c5: 2u8 },
            r5: Row{ c1: 5u8, c2: 2u8, c3: 1u8, c4: 4u8, c5: 3u8 },
        };  
    }

    // List of Skyscrapers clue amounts in the order: left, right, top, bottom.(Rows then columns and if there is no clue, the amount is 0)
    // Should be stored in a struct, it will be passed into the play function.
    // - `clues` : The list of clues.
    struct Clues {
        clues: [u8; 20],
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

    // Check for win 
    // Returns true if check left skyscrapers, check right skyscrapers, check top skyscrapers and check bottom skyscrapers are all true.
    // Returns false if any of check left skyscrapers, check right skyscrapers, check top skyscrapers and check bottom skyscrapers are false.
    function check_win(board: Board, clues: Clues) -> bool {
        return check_left_skyscrapers(board, clues) && check_right_skyscrapers(board, clues) && check_top_skyscrapers(board, clues) && check_bottom_skyscrapers(board, clues);
    }






    //Transition function to play the game
    //It returns an updated board with clues
    // When a player inputs a number into any cell, the checks are performed to see if the number is valid.
    // If the number is valid, the board is updated with the number.
    // If the number is not valid, the board is not updated.
    // Check if all the rows and columns are are filled with numbers.
    // If all the rows and columns are filled with numbers, check if the clues left to right, right to left, top to bottom, bottom to top are satisfied.
    // If all the clues are satisfied, the game is won.
    // If all the clues are not satisfied, the game is not won.
    transition play(board: Board, clues: Clues, row: u8, col: u8, num: u8) -> (Board, Clues, u8) {
        //Check that the inputs are valid
        console.assert(row >= 1u8 && row <= 5u8);
        console.assert(col >= 1u8 && col <= 5u8);

        //Unpack the entries in the board into variables
        let r1c1: u8 = board.r1.c1;
        let r1c2: u8 = board.r1.c2;
        let r1c3: u8 = board.r1.c3;
        let r1c4: u8 = board.r1.c4;
        let r1c5: u8 = board.r1.c5;
        let r2c1: u8 = board.r2.c1;
        let r2c2: u8 = board.r2.c2;
        let r2c3: u8 = board.r2.c3;
        let r2c4: u8 = board.r2.c4;
        let r2c5: u8 = board.r2.c5;
        let r3c1: u8 = board.r3.c1;
        let r3c2: u8 = board.r3.c2;
        let r3c3: u8 = board.r3.c3;
        let r3c4: u8 = board.r3.c4;
        let r3c5: u8 = board.r3.c5;
        let r4c1: u8 = board.r4.c1;
        let r4c2: u8 = board.r4.c2;
        let r4c3: u8 = board.r4.c3;
        let r4c4: u8 = board.r4.c4;
        let r4c5: u8 = board.r4.c5;
        let r5c1: u8 = board.r5.c1;
        let r5c2: u8 = board.r5.c2;
        let r5c3: u8 = board.r5.c3;
        let r5c4: u8 = board.r5.c4;
        let r5c5: u8 = board.r5.c5;

        //Unpack the entries in the clues into variables
        let l1: u8 = 2u8;
        let l2: u8 = 2u8;
        let l3: u8 = 3u8;
        let l4: u8 = 4u8;
        let l5: u8 = 1u8;
        let l6: u8 = 2u8;
        let l7: u8 = 3u8;
        let l8: u8 = 1u8;
        let l9: u8 = 2u8;
        let l10: u8 = 3u8;
        let l11: u8 = 3u8;
        let l12: u8 = 2u8;
        let l13: u8 = 1u8;
        let l14: u8 = 3u8;  
        let l15: u8 = 2u8;
        let l16: u8 = 1u8;
        let l17: u8 = 4u8;
        let l18: u8 = 3u8;
        let l19: u8 = 2u8;
        let l20: u8 = 2u8;
        







        
        
        
        
        
        
        
        
        
        
        


        //Update the board with the number entered by the player
        //If the number is valid, the board is updated with the number
        //If the number is not valid, the board is not updated
        let new_board: Board = board {
            if (row == 1u8 && col == 1u8) {
                r1c1: num
            } else if (row == 1u8 && col == 2u8) {
                r1c2: num
            } else if (row == 1u8 && col == 3u8) {
                r1c3: num
            } else if (row == 1u8 && col == 4u8) {
                r1c4: num
            } else if (row == 1u8 && col == 5u8) {
                r1c5: num
            } else if (row == 2u8 && col == 1u8) {
                r2c1: num
            } else if (row == 2u8 && col == 2u8) {
                r2c2: num
            } else if (row == 2u8 && col == 3u8) {
                r2c3: num
            } else if (row == 2u8 && col == 4u8) {
                r2c4: num
            } else if (row == 2u8 && col == 5u8) {
                r2c5: num
            } else if (row == 3u8 && col == 1u8) {
                r3c1: num
            } else if (row == 3u8 && col == 2u8) {
                r3c2: num
            } else if (row == 3u8 && col == 3u8) {
                r3c3: num
            } else if (row == 3u8 && col == 4u8) {
                r3c4: num
            } else if (row == 3u8 && col == 5u8) {
                r3c5: num
            } else if (row == 4u8 && col == 1u8) {
                r4c1: num
            } else if (row == 4u8 && col == 2u8) {
                r4c2: num
            } else if (row == 4u8 && col == 3u8) {
                r4c3: num
            } else if (row == 4u8 && col == 4u8) {
                r4c4: num
            } else if (row == 4u8 && col == 5u8) {
                r4c5: num
            } else if (row == 5u8 && col == 1u8) {
                r5c1: num
            } else if (row == 5u8 && col == 2u8) {
                r5c2: num
            } else if (row == 5u8 && col == 3u8) {
                r5c3: num
            } else if (row == 5u8 && col == 4u8) {
                r5c4: num
            } else if (row == 5u8 && col == 5u8) {
                r5c5: num
            } 

            // Construct the updated board
            let updated: Board = board {
                r1: Row { c1: r1c1, c2: r1c2, c3: r1c3, c4: r1c4, c5: r1c5 },
                r2: Row { c1: r2c1, c2: r2c2, c3: r2c3, c4: r2c4, c5: r2c5 },
                r3: Row { c1: r3c1, c2: r3c2, c3: r3c3, c4: r3c4, c5: r3c5 },
                r4: Row { c1: r4c1, c2: r4c2, c3: r4c3, c4: r4c4, c5: r4c5 },
                r5: Row { c1: r5c1, c2: r5c2, c3: r5c3, c4: r5c4, c5: r5c5 },
            };

            // Check if the game is over
            // All the checks for the clues are called here for the updated board
            // If all the checks are true, the game is over
            // If any of the checks are false, the game is not over.
            // In short it checks for win
            if check_win (updated, clues) {
                // If the game is over, the board is returned
                return (updated);
            } else {
                // If the game is not over, the board is not updated
                return (board);

            
            

            }


        };

        }
            
        



        




     

   
















}
