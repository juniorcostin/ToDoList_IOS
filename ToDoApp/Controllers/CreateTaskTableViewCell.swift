//
//  CreateTaskTableViewCell.swift
//  ToDoApp
//
//  Created by Costin on 16/09/22.
//

import UIKit

class CreateTaskTableViewCell: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Descrição"
        }else if section == 1{
            return "Categoria"
        } else {
            return "Data e Hora"
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //if indexPath.section == 0{
        //    let cell = tableView.dequeueReusableCell(withIdentifier: "descricaoTask", for: indexPath) as! TaskDescriptionTableViewCell
        //    return cell
        //}
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! dateTimeTableViewCell
        return cell
    }
}
