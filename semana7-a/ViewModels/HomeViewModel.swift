//
//  HomeViewModel.swift
//  semana7-a
//
//  Created by Javier Aponte on 19/05/23.
//

import Foundation

class HomeViewModel {
    
    var todos: [TODO] = []
    
    let urlToDos: String = "https://jsonplaceholder.typicode.com/todos"
    
    func loadData() async {
        guard let url = URL(string: urlToDos) else {
            print("Error en url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // validate
            if let decodeReponse = try? JSONDecoder().decode([TODO].self, from: data) {
                todos = decodeReponse
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
}
