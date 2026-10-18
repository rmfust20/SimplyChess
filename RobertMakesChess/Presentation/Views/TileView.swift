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
                .fill(tile.color == "white" ? Color.white : Color.black)
                .frame(width: 75, height: 75)
            if let piece = tile.piece {
                PieceView(piece: piece)
            }
        }
    }
}

#Preview {
    TileView(tile: BoardTile(color: "white",  piece: nil, coord: (0,0)))
}
