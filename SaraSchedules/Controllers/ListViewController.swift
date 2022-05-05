//
//  ListViewController.swift
//  SaraSchedules
//
//  Created by student on 4/30/22.
//

import UIKit
import Firebase

class ListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
        
    var tasks = [Tasks]()
    var dbReadReference: DatabaseReference?
    @IBOutlet weak var tasksTableView: UITableView!{
        didSet{
            tasksTableView.dataSource = self
            tasksTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromDatabase()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasksTableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "displayTask", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = task.Title
        return cell
    }
    
    func fetchDataFromDatabase(){
        dbReadReference = Database.database().reference().child("Tasks")
        dbReadReference?.observe(.childAdded){ [weak self](snapshot) in
            let key = snapshot.key
            guard let value = snapshot.value as? [String : Any] else {return}
            if let title = value["Title"] as? String, let description = value["Description"] as? String {
                let task = Tasks(id: key, Title: title, Description: description)
                self?.tasks.append(task)
                if let row = self?.tasks.count {
                    let indexPath = IndexPath(row: row-1, section: 0)
                    self?.tasksTableView.insertRows(at: [indexPath], with: .automatic)
                }
            }
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let id = segue.identifier
        if id == "displayTask"{
            let destination = segue.destination as! InfoViewController
            destination.Description = tasks[tasksTableView.indexPathForSelectedRow!.row].Description
            destination.title = tasks[tasksTableView.indexPathForSelectedRow!.row].Title
        }
    }
}



