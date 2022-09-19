//
//  CreateTaskTableViewController.swift
//  ToDoApp
//
//  Created by Costin on 19/09/22.
//

import UIKit

class CreateTaskTableViewController: UITableViewController, UITextFieldDelegate{
    
    private var datePicker : UIDatePicker = UIDatePicker()
    private var dateFormatter = DateFormatter()
    
    private var selectedIndexPath: IndexPath?
    
    private var taskRepository = TaskRepository.instance
    var task: Task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        datePicker.datePickerMode = .dateAndTime
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Descrição"
        }
        if section == 1{
            return "Categoria"
        }
        return "Data e Hora"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDescriptionCell", for: indexPath) as! TaskDescriptionTableViewCell
            cell.taskDescriptionTextField.delegate = self
            return cell
        }
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            cell.textLabel?.text = self.task.categoria.nome
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateTimeCell", for: indexPath) as! DateTimeTableViewCell
        cell.dateTimeTextField.inputView = datePicker
        cell.dateTimeTextField.delegate = self
        cell.dateTimeTextField.inputAccessoryView = accessoryView()
        return cell
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        taskRepository.save(task: task)
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        let cell = textField.superview?.superview as? DateTimeTableViewCell
        if let datecell = cell {
            self.selectedIndexPath = tableView.indexPath(for: datecell)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.task.nome = textField.text!
    }
    
    func accessoryView() -> UIView{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let barItemSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(CreateTaskTableViewController.selectDate))
        toolBar.setItems([barItemSpace, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        return toolBar
    }
    
    @objc func selectDate(){
        if let indexPath = self.selectedIndexPath {
            let cell = tableView.cellForRow(at: indexPath) as? DateTimeTableViewCell
            if let dateCell = cell{
                dateCell.dateTimeTextField.text = dateFormatter.string(from: datePicker.date)
                self.view.endEditing(true)
                self.task.data = datePicker.date
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toCategoriesTableViewController"{
            let categoriesController = segue.destination as! CategoriesTableViewController
            categoriesController.choosenCategory = { category in
                self.task.categoria = category
                self.tableView.reloadData()
            }
        }
    }
}
