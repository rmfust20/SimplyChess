//
//  Board.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/15/26.
//

import Foundation

struct BoardTile {
    let color : String
    var piece : GamePiece?
    let coord: (Int, Int)
}

struct Board {
    let rows : Int = 8
    let columns : Int = 8
    var tiles : [[BoardTile]] = Array(repeating: Array(repeating: BoardTile(color: "white", piece: nil, coord: (0,0)), count: 8), count: 8)
}
