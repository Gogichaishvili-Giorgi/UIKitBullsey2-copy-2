//
//  EditHighScoreViewController.swift
//  UIKitBullsey2
//
//  Created by Giorgi Gogichaishvili on 10/28/21.
//

import UIKit

protocol EditHighScoreViewControllerDelegate: class {
  func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreViewController)
func editHighScoreViewController(
_ controller: EditHighScoreViewController,
    didFinishEditing item: HighScoreItem)
}

class EditHighScoreViewController: UITableViewController, UITextFieldDelegate {
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = highScoreItem.name
        
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: EditHighScoreViewControllerDelegate?
    
    var highScoreItem: HighScoreItem!
    
    
    // MARK:- Actions
    @IBAction func cancel() {
        delegate?.editHighScoreViewControllerDidCancel(self)
        
    }
    @IBAction func done() {
        highScoreItem.name = textField.text!
        delegate?.editHighScoreViewController(self, didFinishEditing: highScoreItem)
    }
    
    //MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //MARK:- Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK:_ Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
    replacementString string: String) -> Bool {
    let oldText = textField.text!
    let stringRange = Range(range, in: oldText)!
    let newText = oldText.replacingCharacters(in: stringRange, with: string)
    if newText.isEmpty {
        doneBarButton.isEnabled = false
    } else {
    doneBarButton.isEnabled = true
        
    }
    return true
}
    
}


