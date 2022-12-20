program sudoku.aleo {

//Define Sudoku rows using structs
struct Row {
    c1: u8, c2: u8, c3: u8, c4: u8, c5: u8, c6: u8, c7: u8, c8: u8, c9: u8
}

//Define Sudoku Board
struct Board {
    r1: Row, r2: Row, r3: Row, r4: Row, r5: Row, r6: Row, r7: Row, r8: Row, r9: Row
}



// Input 2 boards solved and unsolved
// The solved board represents the proposed solution and the unsolved board represents the initial state of the board










//Define a check valid solution function that determines if the proposed solution "solved_board" is the valid  solution to the initial state of the board "unsolved_board"
// Return true if the proposed solution is valid and false otherwise
transition check_valid_solution(solved_board: Board, unsolved_board: Board) -> bool {
    //Check if the proposed solution is valid
    //If the proposed solution is valid return true
    //If the proposed solution is not valid return false

}


transition play_sudoku(unsolved_board: Board, row: u8, col: u8, value: u8) -> Board {
    //Check if the proposed solution is valid
    //If the proposed solution is valid return true
    //If the proposed solution is not valid return false

}





































    
}