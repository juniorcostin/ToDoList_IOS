//
//  TaskRepository.swift
//  ToDoApp
//
//  Created by Costin on 19/09/22.
//

import Foundation

class TaskRepository{
    static let instance: TaskRepository = TaskRepository()
    private var tasks: [Task]
    
    private init(){
        self.tasks = []
    }
    
    func save(task: Task){
        self.tasks.append(task)
    }
    
    func update(taskToUpdate: Task){
       let tasksIndex = tasks.firstIndex{(task) -> Bool in
            task.id == taskToUpdate.id
        }
        tasks.remove(at: tasksIndex!)
        tasks.append(taskToUpdate)
    }
    
    func getTasks() -> [Task]{
        self.tasks
    }
}
