//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-03.
//
import SwiftUI
import Combine

final class GameViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
  //  @Published var game = Game(id: UUID().uuidString, player1Id: "Player 1", player2Id: "Player 2", blockMoveForPlayerId: "Player 2", winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9) )
   
    @Published var game: Game?
    
    @Published var currentUser: User!
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let winPatterns: Set<Set<Int>> = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
    
    init(){
        retrieveUser()
        if (currentUser == nil) {
            saveUser()
        }
        
        print ("We have a user with id", currentUser.id)
        
    }
    
    func getTheGame() {
        FirebaseService.shared.startGame(with: currentUser.id) // Start a gane
        FirebaseService.shared.$game
            .assign(to: \.game, on:self)
            .store(in: &cancellables)
    }
    
    func processPlayerMove (for position: Int, isPlayer1: Bool) {

        if isSquareOccupied(in: game.moves, forIndex: position) { return }
        
        game.moves[position] = Move(isPlayer1: isPlayer1, boardIndex: position )
        game.blockMoveForPlayerId = "PLayer2"
        
        // block the move
        
        // check for win
        if checkForWinCondition(for: true, in: game.moves) {
            print ("You have won!")
            return
        }
        
        // check for draw
        if checkForDraw(in: game.moves) {
            print ("Draw!")
            return
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains (where: { $0?.boardIndex == index} )
    }
    
    func checkForWinCondition(for player1:Bool, in moves: [Move?]) -> Bool {
        // remove all nils
        let playerMoves = moves.compactMap {$0}.filter { $0.isPlayer1 == player1 }
        let playerPositions = Set( playerMoves.map { $0.boardIndex } )
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions ) { return true }
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap {$0}.count == 9
    }
    
    func saveUser() {
        currentUser = User()
        do {
            print ("Encoding user")
            let data = try JSONEncoder().encode(currentUser)
            userData = data
        } catch {
            print ("Could not save user object")
        }
    }

    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            print ("Decoding user")
            currentUser = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            print ("No user saved")
        }
    }
    
}
