//
//  Todo.swift
//  Firebase Todo App (07256)
//
//  Created by Roan Thai Quynh Vy on 1/11/24.
//

import Foundation
import FirebaseFirestore

struct Todo: Identifiable, Codable {
    @DocumentID var id: String? // Firestore will create the id, so we use ?
    let title: String
    let isDone: Bool
}
