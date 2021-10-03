//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-03.
//

import SwiftUI

final class GameViewModel: ObservableObject{
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Published var game = Game(id: UUID().uuidString, player1Id: "Player 1", player2Id: "Player 2", blockMoveForPlayerId: "Player 2", winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9) )
    
    func processPlayerMove (for position: Int, isPlayer1: Bool) {

        if isSquareOccupied(in: game.moves, forIndex: position) { return }
        
        game.moves[position] = Move(isPlayer1: isPlayer1, boardIndex: position )

        // block the move
        
        // check for win
        
        // check for draw

    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains (where: { $0?.boardIndex == index} )
    }
    
}
