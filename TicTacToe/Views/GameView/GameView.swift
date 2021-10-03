//
//  GameView.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-02.
//

import SwiftUI

struct GameView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack{
            Text("Waiting for the player")
            Button{
                print("Quit the game")
            } label: {
                GameButton(title: "Quit", bacgroundColor: Color.red)
            }
            
            Text("Loading View")
            
            Spacer()
        
            VStack{
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack{
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 100, height: 100, alignment: .center)
                        } // ZStack
                    } // ForEach
                } // LazyGrid
            } // VStack
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
