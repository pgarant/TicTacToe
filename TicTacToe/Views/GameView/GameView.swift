//
//  GameView.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-02.
//

import SwiftUI

struct GameView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

//    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack{
                Text("Waiting for the player")
                Button{
//                  viewModel.isGameViewPresented = false
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
                                GameSquareView(proxy: geometry)
                                PlayerIndicatorView(systemImageName: "applelogo")
                            } // ZStack
                            .onTapGesture {
                                print ("Tap on button",i)
                            }
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
