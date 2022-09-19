//
//  CategoriesTableViewController.swift
//  ToDoApp
//
//  Created by Costin on 19/09/22.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    let categories = CategoryRepository.getCategory()
    
    var choosenCategory: ((Category) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseCategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.nome
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        self.choosenCategory!(category)
        self.navigationController?.popViewController(animated: true)
    }

}
