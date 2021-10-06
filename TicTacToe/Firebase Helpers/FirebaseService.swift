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
        FirebaseReference(.Game).whereField("player2Id", isEqualTo: "").whereField("player1Id", isNotEqualTo: userId).getDocuments(FIRQuerySnapshot, error IN
        ) { <#QuerySnapshot?#>, <#Error?#> in
            <#code#>
        }
    }
    
    func listenForGameChanges(){
        
    }
    
    func createNewGame(with userId: String){
        
    }
    
    func quitTheGame(){
        
    }
}
