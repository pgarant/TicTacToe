//
//  LoadingView.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-03.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
