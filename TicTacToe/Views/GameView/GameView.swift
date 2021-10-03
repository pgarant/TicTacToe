//
//  GameView.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-02.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var isPlayer1 = true
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack{
                Text("Waiting for the player")
                
                Button{
                    mode.wrappedValue.dismiss()
                } label: {
                    GameButton(title: "Quit", bacgroundColor: Color.red)
                }
                
                LoadingView()
                
                Spacer()
            
                VStack{
                    LazyVGrid(columns: viewModel.columns, spacing: 5) {
                        
                        ForEach(0..<9) { i in
                            
                            ZStack{
                                
                                GameSquareView(proxy: geometry)
                                
                                PlayerIndicatorView(systemImageName: viewModel.game.moves[i]?.indicator ?? "applelogo")
                                
                            } // ZStack
                            .onTapGesture {

                                viewModel.processPlayerMove(for: i, isPlayer1: isPlayer1)
                                isPlayer1.toggle()
                                
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
        GameView(viewModel: GameViewModel())
    }
}
