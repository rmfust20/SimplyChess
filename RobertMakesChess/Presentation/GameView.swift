//
//  GameView.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/16/26.
//

import SwiftUI

struct GameView: View {
    @StateObject private var boardViewModel = BoardViewModel()
    var body: some View {
    
        ForEach(0..<8, id: \.self) { row in
            HStack {
                ForEach(0..<8, id: \.self) { column in
                    let tile = boardViewModel.board[row][column]
                    BoardTileView(tile: tile)
                }
            }
        }
    }
}

#Preview {
    GameView()
}
