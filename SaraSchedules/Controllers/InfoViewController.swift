//
//  InfoViewController.swift
//  SaraSchedules
//
//  Created by student on 4/30/22.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var reminderTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderTextView.text = Description
    }
    
    var Description: String?

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
