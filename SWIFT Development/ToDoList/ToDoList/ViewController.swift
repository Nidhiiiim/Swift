//
//  ViewController.swift
//  ToDoList
//
//  Created by Nidhi Mishra on 3/16/23.
//

import UIKit

class ViewController: UIViewController {
    var toDoArr: [String] = []
    @IBOutlet weak var tableViewReference: UITableView!
    // declare array for input
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewReference.dataSource = self
        tableViewReference.register(UINib(nibName: "MyTodoListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTodoListCellTableViewCell")
        tableViewReference.delegate = self
    }
    
    @IBAction func AddPressed(_ sender: UIButton) {
        let alertVar = UIAlertController(title: "Add Item", message: "Add your today's work items", preferredStyle: .alert)
        alertVar.addTextField()
        let actionVar = UIAlertAction(title: "Add", style: .default, handler: { _ in
            let addedTask = alertVar.textFields?.first
            if let task = addedTask?.text {
                self.toDoArr.append(task)
                self.tableViewReference.reloadData()
            }
        })
        alertVar.addAction(actionVar)
        self.present(alertVar, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let checkBox = tableView.cellForRow(at: indexPath) as? MyTodoListCellTableViewCell
        else
        {
            return
        }
        
        if checkBox.checkBoxRef.image == UIImage(systemName: "checkmark.circle"){
            checkBox.checkBoxRef.image = UIImage(systemName: "circle")
        }
        else{
            checkBox.checkBoxRef.image = UIImage(systemName: "checkmark.circle")
        }
            
        //checkBox.checkBoxRef?.image = UIImage(systemName: "checkmark.circle")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTodoListCellTableViewCell") as? MyTodoListCellTableViewCell
            else {
                return UITableViewCell()
            }
            cell.labelRef.text = toDoArr[indexPath.row]
            return cell
        }
}



