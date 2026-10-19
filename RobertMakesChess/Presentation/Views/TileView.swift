//
//  TileView.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/18/26.
//

import SwiftUI

struct TileView: View {
    let tile: BoardTile
    var body: some View {
        ZStack {
            Rectangle()
                .fill(tile.color == "white" ? Color.red : Color.black)
                .frame(width: 50, height: 50)
            if let piece = tile.piece {
                PieceView(piece: piece)
            }
        }
    }
}

#Preview {
    TileView(tile: BoardTile(color: "white",  piece: nil, coord: (0,0)))
}
