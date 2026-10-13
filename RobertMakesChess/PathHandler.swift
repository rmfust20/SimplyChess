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
    
    // except for the night we can generate the sightlines for every piece on the board at the start of the game
    
    func generateInitialSightlines() {
        // this func will fill the sighlines with the starting sightlines for every piece
    }
    
    // now anytime a piece move we will call this func to maintain board state
    
    func updateSightLines(proposedMove: (pieceID: String, from: (Int,Int), to: (Int,Int))) {
        // i think to keep things smart we need to do like a diff, but whats hard is one piece moving could effect 5 sightlines -> I think the way to do this though is we need to
        
        // so lets say a piece wants to move then we need to collect all the sightLines that need to be updated'
        
        // if we find an update that would enter check we need to rollback -> assuming this is the non attacker
        
        //ok so what do we actually do here
        
        //is it as adding to sightlines? no first we check the proposed move
        
        // collect all sightlines that would be affect by this move
    }
}
