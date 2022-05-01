//
//  AddViewController.swift
//  SaraSchedules
//
//  Created by student on 4/30/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class AddViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reminderTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func unwindToDashBoard(){
        performSegue(withIdentifier: "backToHome", sender: self)
    }
    
    func messageAlert(title:String, message:String) {
            let errorAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            errorAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { (ACTION) in
                errorAlert.dismiss(animated: true, completion: nil)
            }))
            self.present(errorAlert, animated: true, completion: nil)
        }
    
    func navigateAlert(title:String, message:String) {
            let errorAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            errorAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { (ACTION) in
                
                //self.unwindToDashBoard()
            }))
            self.present(errorAlert, animated: true, completion: nil)
        }

    func uploadToFirebase(){
        let taskTitle = titleTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let taskDescription = reminderTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let db = Firestore.firestore()
        db.collection("RemindersDB").addDocument(data: ["Title" : taskTitle,
                                                        "Task" : taskDescription
                                                       ]) { (error) in
            if error != nil {
                self.messageAlert(title: "Data fetch Error", message: "We have experienced an error while fetching your data. Please try again.")
            }
            self.navigateAlert(title: "Success", message: "Uploaded to Database successfully")
        }
    }
}
