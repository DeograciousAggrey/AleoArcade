#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

#Create a new game.
echo "
#########################################################################################
########                                                                         ########
########          STEP 0: Creating a new game of Skyscrapers                     ########
########                           3   2   1   3   2                             ########
########                         ____________________                            ########
########                                                                         ########
########                      2->|3  |1  | 5 | 2 | 4 |<-2                        ########
########                      2->|4  |5  | 2 | 3 | 1 |<-3                        ########
########                      3->|2  |4  | 3 | 1 | 5 |<-1                        ########
########                      4->|1  |3  | 4 | 5 | 2 |<-2                        ########
########                      1->|5  |2  | 1 | 4 |   |<-3                        ########
########                         _____________________                           ########                    
########                           1   4   3   2   2                             ########
#########################################################################################
"
leo run empty_board






