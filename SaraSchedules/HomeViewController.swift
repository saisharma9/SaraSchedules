//
//  ViewController.swift
//  SaraSchedules
//
//  Created by student on 4/7/22.
//

import UIKit
 
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = taskTableViewOutlet.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = todo[indexPath.row][0]
        return cell
    }

    @IBOutlet weak var taskTableViewOutlet: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskTableViewOutlet.delegate = self
        taskTableViewOutlet.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskTableViewOutlet.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            var transition = segue.identifier
            if transition == "taskInfoSegue"{
                var destination = segue.destination as! InfoViewController
                
            }
    }

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
    }
}
