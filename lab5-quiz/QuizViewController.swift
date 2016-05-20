//
//  QuizViewController.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 19.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var currentWordLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var quiz: Quiz?
    var numberOfPlays : Int? // this comes from other controler
    let dictionary = Dictionary.createOrGetDictionaryFrom("eng", to: "fin")
    var corrects = 0
    var wrongs = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(numberOfPlays)
        quiz = Quiz(numberOfPlays: numberOfPlays!, dictionary: dictionary!)
        currentWordLabel.text = quiz!.currentWord
    }
    
    override func viewWillAppear(animated: Bool) {
        print("new game")
        quiz = Quiz(numberOfPlays: numberOfPlays!, dictionary: dictionary!)
        corrects = 0
        wrongs = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func nextButtonClick(sender: UIButton) {
        let (word, result) = quiz!.getNextQuestion(answerTextField.text!)
        print(result)
        if(result){
            onCorrectAnswer()
        }else{
            if(word == ""){
                onGameOver()
                return
            }else{
                onWrongAnswer()
            }
        }
        onAlways(word)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func onCorrectAnswer(){
        let green = UIColor(red: 100/255, green: 255/255, blue: 100/255, alpha: 0.5)
        answerTextField.backgroundColor = green
        corrects += 1
    }
    
    func onWrongAnswer(){
        let red = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 0.5)
        answerTextField.backgroundColor = red
        wrongs += 1
    }
    
    
    
    func onGameOver(){
        currentWordLabel.text = "game over"
        scoreLabel.text = "final score: " + String(quiz!.score)
        scoreLabel.hidden = false
        nextButton.enabled = false
        //hide keyboard
        answerTextField.resignFirstResponder()
        print("statistics: wrong:" + String(wrongs) + " correct: " + String(corrects))
        Statistics.createAndGetStatistics(wrongs, corrects: corrects)
    }
    
    func onAlways(word: String){
        answerTextField.text = ""
        currentWordLabel.text = word
        print("next: "+word)
    }

}
