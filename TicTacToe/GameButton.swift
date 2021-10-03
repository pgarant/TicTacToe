//
//  GameButton.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-02.
//

import SwiftUI

struct GameButton: View {
    
    let title: String
    let bacgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.semibold)
            .frame(width: 300, height: 50)
            .background(bacgroundColor)
            .foregroundColor(Color.white)
            .cornerRadius(30)
    }
}

struct GameButton_Previews: PreviewProvider {
    static var previews: some View {
        GameButton(title: "String", bacgroundColor: Color.red)
    }
}
