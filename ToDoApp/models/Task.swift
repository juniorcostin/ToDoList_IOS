//
//  Task.swift
//  ToDoApp
//
//  Created by Costin on 16/09/22.
//

import Foundation

struct Task{
    var id = UUID()
    var nome: String = ""
    var data: Date = Date()
    var categoria: Category = Category(nome: " ", cor: .black)
    
}
