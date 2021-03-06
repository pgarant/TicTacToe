//
//  FirebaseReference.swift
//  TicTacToe
//
//  Created by Pierre Garant on 2021-10-05.
//

import Firebase

enum FCollectionReference: String {
    case Game
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
