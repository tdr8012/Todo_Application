//
//  FirebaseViewModel.swift
//  Firebase Todo App (07256)
//
//  Created by Roan Thai Quynh Vy on 1/11/24.
//

import Foundation
import FirebaseFirestore

import Combine

// there is a 2 way communication b/w client and server. (websockets)
class FirebaseViewModel: ObservableObject{
    //static
    static let shared = FirebaseViewModel()
    
    //initialize the db
    private let db = Firestore.firestore()
    @Published var todos: [Todo] = []
    
    //Cancellables
    private var cancellables: Set<AnyCancellable> = []
    
    init (){
        fetchTodos()
    }
    // fetch the list of todos
    func fetchTodos(){
        db.collection("todos").addSnapshotListener{
            querySnapshot, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            self.todos = querySnapshot?.documents.compactMap{
                document in
                try? document.data(as: Todo.self)
            } ?? []
        }
    }
    
    // add a todo
    func addTodo(title: String){
        let newTodo = Todo(title: title, isDone: false)
        do{
            try db.collection("todo").addDocument(from: newTodo)
        }catch{
                print("Error \(error)")
            }
    }
}
