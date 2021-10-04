//
//  User.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-03.
//

import Foundation

struct User: Codable {
    var id = UUID().uuidString
    var name: String  = ""
    var score: Int = 0
    var gamesPlayer: Int = 0
    var gamesWon: Int = 0
    var gamesLost: Int = 0
    var gamesDraw: Int = 0
}
