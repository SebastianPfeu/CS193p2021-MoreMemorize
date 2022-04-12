//
//  MoreMemorizeApp.swift
//  MoreMemorize
//
//  Created by Sebastian Pfeufer on 07.04.22.
//

import SwiftUI

@main
struct MoreMemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
