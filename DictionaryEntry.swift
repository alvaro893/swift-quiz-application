//
//  DictionaryEntry.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 17.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class DictionaryEntry: NSManagedObject {

    func addSynonym(word: String) {
        let context = ((UIApplication.sharedApplication().delegate) as!
            AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Synonym")
        let predicate = NSPredicate(format: "word == %@ AND dictionaryEntry.word == %@", argumentArray: [ word, self.word ])
        request.predicate = predicate
        do {
            let results = try context.executeFetchRequest(request) as! [
                Synonym ]
            if (results.count == 0) {
                let synonym = NSEntityDescription.insertNewObjectForEntityForName("Synonym",inManagedObjectContext: context) as! Synonym
                synonym.word = word
                synonym.dictionaryEntry = self
            }
        } catch {
            print("createOrGetDictionaryEntry() fails. Oh no.")
        }
    }

}
