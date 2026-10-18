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
        Image("rookWhite")
            .resizable()
            .frame(width: 50, height: 50)
    }
}

#Preview {
    PieceView(piece: Rook(color: "white", position: (0,0), id: "1"))
}
