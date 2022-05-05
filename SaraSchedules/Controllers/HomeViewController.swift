//
//  ViewController.swift
//  SaraSchedules
//
//  Created by student on 4/7/22.
//

import UIKit
 
class HomeViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueID = segue.identifier
        if segueID == "showTasksTable"{
            let dest = segue.destination as! ListViewController
        }
    }
}
