//
//  ListTableViewController.swift
//  SaraSchedules
//
//  Created by student on 5/2/22.
//

import UIKit
import Firebase

class ListTableViewController: UITableViewController {

    var tasks = [Tasks]()
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    func fetchDataFromDatabase(){
        let dbReadReference = Database.database().reference()
        
        dbReadReference.child("Tasks").observe(.value) { (snapshot) in
            if snapshot.value != nil{
                for child in snapshot.children {
                    let task = Tasks()
                    let childSnapshot = child as! DataSnapshot
                    if childSnapshot.hasChild("Title") {
                        task.Title = childSnapshot.childSnapshot(forPath: "Title").value as! String
                    }
                    if childSnapshot.hasChild("Description") {
                        task.Description = childSnapshot.childSnapshot(forPath: "Description").value as! String
                    }
                    self.tasks.append(task)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        tasksTableView.reloadData()
        fetchDataFromDatabase()
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
     */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskTitle", for: indexPath)
        cell.textLabel!.text = tasks[indexPath.row].Title
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow
        let id = segue.identifier
        if id == "displayTask"{
            let destination = segue.destination as! InfoViewController
            destination.Description = tasks[indexPath!.row].Description
        }
    }

}
