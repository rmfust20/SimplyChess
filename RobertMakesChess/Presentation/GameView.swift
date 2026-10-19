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
    
        VStack(spacing:0) {
        ForEach(0..<8, id: \.self) { row in
            HStack(spacing:0) {
                ForEach(0..<8, id: \.self) { column in
                    TileView(tile: boardViewModel.board[row][column])
                        .onTapGesture {
                            // basically want to highlight the path, we can handle that later
                            //and then it makes the board tappable right?
                            
                            //so really when you tap on a piece something on the board needs to react to it
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GameView()
}
