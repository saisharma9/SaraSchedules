//
//  InfoViewController.swift
//  SaraSchedules
//
//  Created by student on 4/30/22.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var reminderTextView: UITextView!
    var Description: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reminderTextView.text! = Description!
        // Do any additional setup after loading the view.
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
