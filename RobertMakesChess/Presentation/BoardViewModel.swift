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
    
    
}
