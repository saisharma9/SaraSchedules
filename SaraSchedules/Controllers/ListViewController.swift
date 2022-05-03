//
//  ListViewController.swift
//  SaraSchedules
//
//  Created by student on 4/30/22.
//

import UIKit
import Firebase

class ListViewController: UIViewController {
    
    //@IBOutlet var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tasksTableView.dataSource = self
//        tasksTableView.delegate = self
//        tasksTableView.reloadData()
//        let dbReadReference = Database.database().reference()
//        self.tasks.removeAll()
//        dbReadReference.child("Tasks").observe(.value) { (snapshot) in
//            if snapshot.value != nil{
//                for child in snapshot.children {
//                    let task = Tasks()
//                    let childSnapshot = child as! DataSnapshot
//                    if childSnapshot.hasChild("Title") {
//                        task.Title = childSnapshot.childSnapshot(forPath: "Title").value as! String
//                    }
//                    if childSnapshot.hasChild("Description") {
//                        task.Description = childSnapshot.childSnapshot(forPath: "Description").value as! String
//                    }
//                    self.tasks.append(task)
//                }
//            }
//        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

//extension ListViewController: UITableViewDelegate, UITableViewDataSource {
//
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        self.tasks.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "taskTitle")
////        let task = self.tasks[indexPath.row]
////        cell?.textLabel!.text = task.Title
////        return cell!
////    }
//
//
//}
