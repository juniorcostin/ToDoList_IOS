//
//  TasksTableViewController.swift
//  ToDoApp
//
//  Created by Costin on 16/09/22.
//

import UIKit

let verde = Category(nome: "compras", cor: UIColor.green)
let azul = Category(nome: "estudar", cor: UIColor.blue)
let tasks: [Task] = [
    Task(nome: "Esta é minha Task", data: Date(), categoria: verde),
    Task(nome: "Esta é minha segunda Task", data: Date(), categoria: azul),
    Task(nome: "Esta é minha terceira Task", data: Date(), categoria: verde),
    Task(nome: "Esta é minha quarta Task", data: Date(), categoria: azul),
    Task(nome: "Esta é minha quinta Task dausdhaisuhdaiuhduaishdiuahduiahduiahdiuahsiudhaiushdaiuhdsiuahdaiuhdiuashdiuahduiashdiuahdiuahdiuash", data: Date(), categoria: verde)
]

class TasksTableViewController: UITableViewController {
    
    private var dateFormatter: DateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TasksTableViewCell
        let task = tasks[indexPath.row]
        
        dateFormatter.dateFormat = "HH:mm"
        cell.horaLabel.text = dateFormatter.string(from: task.data)
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cell.dataLabel.text = dateFormatter.string(from: task.data)
        
        cell.nomeCategoriaLabel.text = task.categoria.nome
        cell.corCategoria.backgroundColor = task.categoria.cor
        cell.descricaoTaskLabel.text = task.nome
        
        return cell
    }
}
