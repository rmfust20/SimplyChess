//
//  PieceView.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 10/17/26.
//

import SwiftUI

struct PieceView: View {
    let piece: GamePiece
    var body: some View {
        Image("whiteRook")
            .resizable()
            .frame(width: 30, height: 30)
    }
}

#Preview {
    PieceView(piece: Rook(color: "white", position: (0,0), id: "1"))
}
