//
//  GameView.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/16/26.
//

import SwiftUI

struct GameView: View {
    @Environment(BoardViewModel.self) private var vm
    var body: some View {
    
        VStack(spacing:0) {
        ForEach(0..<8, id: \.self) { row in
            HStack(spacing:0) {
                ForEach(0..<8, id: \.self) { column in
                    TileView(tile: vm.getBoardTile(row: row, column: column))
                        .onTapGesture {
                            vm.handlePieceTap(piece: vm.getBoardTile(row: row, column: column).piece!, row: row, column: column)
                        }
                    }
                }
            }
        }
        
        switch vm.boardState {
        case .inProgress:
            Text("Loading...")
        default:
            Text("hello")
        }
    }
}

#Preview {
    GameView()
}
