//
//  BoardViewModel.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/16/26.
//

import Foundation
import SwiftUI


@MainActor @Observable class BoardViewModel {
    var boardState: BoardState
    
    init() {
        self.boardState = .loaded(board: BoardBrain.shared.board)
    }
    
    // before whoop I'd probably keep something here to commuunicate that the board has been tapped and what piece it was
    
    // break this up into smaller checkpoints
    // step 1 user clicks on a piece:
        // highlight the piece and show possible moves
    // step 2 user clicks on a tile:
        //update the board State
        //process the move and remove highlights
    
   func getBoardTile(row: Int, column: Int) -> BoardTile {
        return BoardBrain.shared.board[row][column]
    }
        
    
    func handlePieceTap(piece: GamePiece, row: Int, column: Int) {
        //update BoardState to inProgress
        boardState = .inProgress
        BoardBrain.shared.highlightPath(for: piece, at: (row, column))
        // we have something subscribing to this change which highlights the board
    }
}
