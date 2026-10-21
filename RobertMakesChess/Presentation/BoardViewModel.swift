//
//  BoardViewModel.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/16/26.
//

import Foundation
import Combine

final class BoardViewModel: ObservableObject {
    @Published var board: [[BoardTile]] = []
    
    init() {
        board = BoardBrain.shared.board
        BoardBrain.shared.setupBoard()
    }
    
    // before whoop I'd probably keep something here to commuunicate that the board has been tapped and what piece it was
    
    // break this up into smaller checkpoints
    // step 1 user clicks on a piece:
        // highlight the piece and show possible moves
    // step 2 user clicks on a tile:
        //update the board State
        //process the move and remove highlights
    
    func handlePieceTap(selectedTile: BoardTile) {
        //update BoardState to inProgress
        
    }
}
