//
//  BoardState.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/19/26.
//

import Foundation

//likely will need more in the future but this should get me going

enum BoardState {
    case loaded(board: [[BoardTile]])
    case inProgress
}
