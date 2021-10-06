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
        
    }
    
    func startGame(with userId: String){
        
    }
    
    func listenForGameChanges(){
        
    }
    
    func createNewGame (with userId: String){
        
    }
    
    func quitTheGame (){
        
    }
}
