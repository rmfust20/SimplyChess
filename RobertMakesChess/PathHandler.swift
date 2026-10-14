//
//  PathHandler.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/12/26.
//

import Foundation

final class PathHandler {
    static let shared = PathHandler()
    
    private init () {}
    
    var sightlines: [String: [(Int,Int)]] = [:] // this is a dictionary where the key is the piece id and the value is an array of coordinates that represent the sightline for that piece
    
    var isAttacked: [String: [String]] = [:] // this is a dict where the key is a piece id and the value is all the pieces that are attacking it
    
    // except for the night we can generate the sightlines for every piece on the board at the start of the game
    
    func generateInitialSightlines() {
        // this func will fill the sighlines with the starting sightlines for every piece
    }
    
    // now anytime a piece move we will call this func to maintain board state
    
    func updateSightLines(proposedMove: (piece: GamePiece, from: (Int,Int), to: (Int,Int)), board: Board) {
        //now we will have a sightline as well as the pieces being attacked
        // with that i think we can solve check
       
        
        var sightLine = proposedMove.piece.generateMovePath(currentPosition: proposedMove.from, board: Board(tiles: BoardBrain().board))
        
        // now we have a sightline for the piece
        
        // for now lets mark all collision
        
        var collisionCoordinates = [(Int,Int)]()
      
    
    }
}
