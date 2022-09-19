//
//  CategoryRepository.swift
//  ToDoApp
//
//  Created by Costin on 19/09/22.
//

import Foundation
import UIKit

class CategoryRepository{
    static func getCategory() -> [Category]{
        let categories = [
            Category(nome: "Trabalho", cor: UIColor.green),
            Category(nome: "Estudos", cor: UIColor.blue),
            Category(nome: "To Dos", cor: UIColor.yellow),
            Category(nome: "Lembretes", cor: UIColor.red)
        ]
        
        return categories
    }
}
