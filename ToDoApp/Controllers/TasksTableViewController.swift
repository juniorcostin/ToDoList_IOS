//
//  TasksTableViewController.swift
//  ToDoApp
//
//  Created by Costin on 16/09/22.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    private var dateFormatter: DateFormatter = DateFormatter()
    private var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tasks = TaskRepository.instance.getTasks()
        self.tableView.reloadData()
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
