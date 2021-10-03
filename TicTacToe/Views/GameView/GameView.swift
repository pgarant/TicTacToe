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
        
        GeometryReader { geometry in
            
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
                                    .foregroundColor(.blue.opacity(0.7))
                                    .frame(width: geometry.size.width/3 - 15
                                           , height: geometry.size.width/3 - 15 )
                                Image(systemName: "applelogo")
                                    .resizable()
                                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                                    .foregroundColor(.white)
                            } // ZStack
                        } // ForEach
                    } // LazyGrid
                } // VStack 2
            } // VStack 1
        } // Geometry Reader
    } // Bpdy
} // Struct

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
