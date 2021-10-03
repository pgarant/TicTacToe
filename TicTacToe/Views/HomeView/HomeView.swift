//
//  ContentView.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-02.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        
        VStack{
            Button{
                viewModel.isGameViewPresented = true
            } label: {
                GameButton(title: "Play", bacgroundColor: Color.green)
            }
        }
        .fullScreenCover(isPresented: $viewModel.isGameViewPresented){
            GameView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
