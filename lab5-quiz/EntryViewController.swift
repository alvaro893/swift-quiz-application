//
//  EntryViewController.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 18.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var sym1TextField: UITextField!
    @IBOutlet weak var sym2TextField: UITextField!
    @IBOutlet weak var sym3TextField: UITextField!
    @IBOutlet weak var sym4TextField: UITextField!
    var word: String?
    var symTextFields : Array<UITextField>!
    var synonymArray : [String]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        symTextFields = [sym1TextField, sym2TextField, sym3TextField, sym4TextField]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: actions
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    // MARK: - Navigation

    // 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            print(segue)
        if saveButton === sender {
            print("saving new entry....")
            word = wordTextField.text ?? ""
            // save symonyms in array
            synonymArray = [String]()
            for symTextField in symTextFields{
                if !(symTextField.text!.isEmpty) {
                    synonymArray?.append(symTextField.text!)
                }
            }
        }
    }
    
    
    // MARK: UITextFieldDelegate
    
    
    
    

}
