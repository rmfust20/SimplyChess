//
//  RobertMakesChessApp.swift
//  RobertMakesChess
//
//  Created by Robert Fusting on 9/20/26.
//

import SwiftUI

@main
struct RobertMakesChessApp: App {
    @State private var vm : BoardViewModel = BoardViewModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environment(vm)
        }
    }
}
