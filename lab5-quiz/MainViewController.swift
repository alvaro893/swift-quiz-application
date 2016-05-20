//
//  MainViewController.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 19.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    var numberOfPlays = 5
    let min = 5
    var max: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String(numberOfPlays)
        getMaximum()
    }
    
    override func viewWillAppear(animated: Bool) {
        getMaximum()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? QuizViewController {
            destination.numberOfPlays = self.numberOfPlays
        }
    }
 
    
    // MARK: Actions
    
    @IBAction func plusButtonClicked(sender: AnyObject) {
        if( numberOfPlays < max){
            numberOfPlays += 1
            numberLabel.text = String(numberOfPlays)
        }
        
    }

    @IBAction func minusButtonClicked(sender: UIButton) {
        if(numberOfPlays > min){
            numberOfPlays -= 1
            numberLabel.text = String(numberOfPlays)
        }
        
    }
    

    // MARK: custom funcions
    
    func getMaximum() {
        let dictionary = Dictionary.createOrGetDictionaryFrom("eng", to: "fin")
        let dictionaryEntries = dictionary!.words
        self.max = dictionaryEntries.count
    }
    
}
