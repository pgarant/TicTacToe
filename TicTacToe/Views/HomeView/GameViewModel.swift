//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-03.
//

import SwiftUI

final class GameViewModel: ObservableObject{
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

}
