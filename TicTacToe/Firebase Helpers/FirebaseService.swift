//
//  FirebaseService.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-05.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

final class FirebaseService: ObservableObject{
    static let shared = FirebaseService()
    @Published var game: Game!
    
    init() {
        
    }
    
    func createOnlineGame() {
        // Save the game online
        
        do {
            try FirebaseReference(.Game).document(self.game.id).setData(from: self.game)
        } catch {
            print ("Error creating online game",error.localizedDescription)
        }
    }
    
    func startGame(with userId: String){
        FirebaseReference(.Game).whereField("player2Id", isEqualTo: "").whereField("player1Id",isNotEqualTo: userId).getDocuments{querySnapshot, error in

            if error != nil {
                print ("Error starting game",error?.localizedDescription)
                //  Create new game
                self.createNewGame(with: userId)
                return
            }
            
            // If at least a game already exist
            if let gameData = querySnapshot?.documents.first {

                self.game = try? gameData.data(as: Game.self)
                self.game.player1Id = userId
                self.game.blockMoveForPlayerId = userId
                
                self.updateGame(self.game)
                self.listenForGameChanges()
            } else {
                // Create a new game
                self.createNewGame(with: userId)
            }
            
        }
        
    }
    
    func listenForGameChanges(){
        
    }
    
    func createNewGame(with userId: String){
        print ("creating game for userid", userId)
        
        self.game = Game(id: UUID().uuidString, player1Id: userId, player2Id: "", blockMoveForPlayerId: userId, winningPlayerId: "", rematchPlayerId: [], moves: Array(repeating: nil, count: 9))
        self.createOnlineGame()
        self.listenForGameChanges()
    }
    
    func updateGame(_ game:Game) {
        
    }
    
    func quitTheGame(){
        
    }
}
