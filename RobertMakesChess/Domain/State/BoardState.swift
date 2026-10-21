//
//  BoardState.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/19/26.
//

import Foundation

//likely will need more in the future but this should get me going

enum BoardState {
    case initial(board: Board)
    case inProgress
    case processedMove(board: Board)
}
