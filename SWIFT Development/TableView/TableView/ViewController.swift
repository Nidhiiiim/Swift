//
//  ViewController.swift
//  TableView
//
//  Created by Nidhi Mishra on 3/13/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableViewReference: UITableView!
//    let toDoList: [String] = [
//    "Make Breakfast",
//    "Clean utensils",
//    "Clean house",
//    "Study IOS"
//    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewReference.dataSource = self
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enter new ToDo List Item", message: "Message", preferredStyle: .alert)
        var action = UIAlertAction(title: "Add", style: .cancel, handler: { action in
            let textField = alert.textFields?.first
            print(textField?.text)
            let textField2 = alert.textFields?[1]
            print(textField2?.text)
            let textField3 = alert.textFields?[2]
            print(textField3?.text)
            self.tableViewReference.reloadData()
        })
        alert.addTextField()
//        alert.addTextField()
//        alert.addTextField()
//        alert.textFields?.first?.backgroundColor = .green
//        alert.textFields?.first?.placeholder = "This is prefilled"
        alert.addAction(action)
        self.present(alert, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableViewID") else { // UITableViewCell?
            return UITableViewCell()
        }
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

