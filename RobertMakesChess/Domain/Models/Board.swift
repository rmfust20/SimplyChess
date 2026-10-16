//
//  Board.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/15/26.
//

import Foundation

struct BoardTile {
    let color : String
    let piece : GamePiece?
    let coord: (Int, Int)
}

struct Board {
    let rows : Int = 8
    let columns : Int = 8
    var tiles : [[BoardTile]] = []
}
