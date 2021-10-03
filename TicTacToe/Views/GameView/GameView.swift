//
//  GameView.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-02.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack{
            Text("Waiting for the player")
            Button{
                print("yeah")
            } label: {
                GameButton(title: "Quit", bacgroundColor: Color.red)
            }
            Text("Loading View...")
            Spacer()
            Text("Game View Here...")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
