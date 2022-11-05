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
        
    // Returns the number of visible skyscrapers from the left of the board.
    transition left_visible(board: Board) -> u8 {
        let mut visible: u8 = 0u8;
        let mut max: u8 = 0u8;
        for i in 0..5 {
            let row: Row = board.r1;
            let value: u8 = row.c1;
            if value > max {
                visible += 1u8;
                max = value;
            }
        }
        return visible;
    }

    // Returns the number of visible skyscrapers from the right of the board.
    transition right_visible(board: Board) -> u8 {
        let mut visible: u8 = 0u8;
        let mut max: u8 = 0u8;
        for i in 0..5 {
            let row: Row = board.r1;
            let value: u8 = row.c1;
            if value > max {
                visible += 1u8;
                max = value;
            }
        }
        return visible;
    }

    // Returns the number of visible skyscrapers from the top of the board.
    transition top_visible(board: Board) -> u8 {
        let mut visible: u8 = 0u8;
        let mut max: u8 = 0u8;
        for i in 0..5 {
            let row: Row = board.r1;
            let value: u8 = row.c1;
            if value > max {
                visible += 1u8;
                max = value;
            }
        }
        return visible;
    }

    // Returns the number of visible skyscrapers from the bottom of the board.
    transition bottom_visible(board: Board) -> u8 {
        let mut visible: u8 = 0u8;
        let mut max: u8 = 0u8;
        for i in 0..5 {
            let row: Row = board.r1;
            let value: u8 = row.c1;
            if value > max {
                visible += 1u8;
                max = value;
            }
        }
        return visible;
    }

    // Check for a win
    // Returns "true" for the following board: 
    // The object is to place a skyscraper in each cell, with a height between 1 and 5 inclusive, 
    // so that no two skyscrapers in a row or column have the same height.
    // In addition, the number of visible skyscrapers from the left, right, top, and bottom must match the clues given in the input.
    // higher skyscrapers block the view of lower skyscrapers located behind them.
    
    
    




















}
