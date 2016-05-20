//
//  Quiz.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 19.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import Foundation

class Quiz {
    // general
    var dictionaryEntries: Array<DictionaryEntry>
    var numberOfPlays : Int
    var score : Int
    
    // for every play
    var currentWord: String?
    var currentSynonyms: Array<Synonym>?
    
    
    init(numberOfPlays: Int, dictionary: Dictionary){
        let dictionaryEntries = dictionary.words
        print(dictionary.words.count)
        self.dictionaryEntries = Array(dictionaryEntries)
        self.numberOfPlays = numberOfPlays
        
        //randomize
        self.dictionaryEntries.shuffle()
        
        //first time
        let entry = self.dictionaryEntries.popLast()
        self.currentWord = entry!.word
        self.currentSynonyms = Array(entry!.synonyms)
        self.score = 0
        self.numberOfPlays -= 1
    }
    
    
    func getNextQuestion(answer: String) -> (String, Bool) {
        print(numberOfPlays)
        print(dictionaryEntries.count)
        if(numberOfPlays <= 0){
            print("game is finished")
            return("", false)
        }
        let wasAnswerCorrect = chekcAnswer(answer)
        print("was answer correct: " + String(wasAnswerCorrect))
        
        if let entry = dictionaryEntries.popLast() {
            currentWord = entry.word
            currentSynonyms = Array(entry.synonyms)
            return (currentWord!, wasAnswerCorrect)
        }
        return ("", false)
        
    }
    
    private func chekcAnswer(answer: String) -> Bool {
        var result = false
        for synonym in currentSynonyms! {
            result = synonym.word == answer
            if(result) {
                score += 1
                break
            }
        }
        numberOfPlays -= 1
        return result
    }

}

