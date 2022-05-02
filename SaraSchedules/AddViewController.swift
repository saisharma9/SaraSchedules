//
//  AddViewController.swift
//  SaraSchedules
//
//  Created by student on 4/30/22.
//

import UIKit
import FirebaseDatabase
//import FirebaseFirestore

class AddViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reminderTextView: UITextView!
    var dbReference: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbReference = Database.database().reference()

    }
    
    func clearFields(){
        titleTextField.text = nil
        reminderTextView.text = nil
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
                self.clearFields()
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(errorAlert, animated: true, completion: nil)
        }

    func uploadToFirebase(){
        let taskTitle = titleTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let taskDescription = reminderTextView.text!.trimmingCharacters(in: .whitespaces)
        dbReference?.child("Tasks").childByAutoId().setValue(["Title":taskTitle,
                                                              "Description":taskDescription])
    }
    
    @IBAction func SaveBtnClicked(_ sender: UIBarButtonItem) {
        uploadToFirebase()
        navigateAlert(title: "Success", message: "Uploaded to database successfully.")
    }
    
}
