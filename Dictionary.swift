//
//  Dictionary.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 17.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Dictionary: NSManagedObject {

    class func createOrGetDictionaryFrom(from: String, to: String) ->
        Dictionary? {
            let context = ((UIApplication.sharedApplication().delegate) as!
                AppDelegate).managedObjectContext
            let request = NSFetchRequest(entityName: "Dictionary")
            let predicate = NSPredicate(format: "from == %@ AND to == %@",
                                        argumentArray: [ from, to ])
            request.predicate = predicate
            do {
                let results = try context.executeFetchRequest(request) as! [
                    Dictionary ]
                if (results.count == 0) {
                    print("Creating new dictionary")
                    let dictionary = NSEntityDescription.insertNewObjectForEntityForName("Dictionary", inManagedObjectContext:context) as! Dictionary
                    dictionary.from = from
                    dictionary.to = to
                    return dictionary
                } else {
                    print("Found existing dictionary")
                    return results[ 0 ]
                }
            } catch {
                print("createOrGetDictionary() fails. Oh no.")
                return nil
            }
    }
    func createOrGetDictionaryEntry(word: String) -> DictionaryEntry? {
        let context = ((UIApplication.sharedApplication().delegate) as!
            AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "DictionaryEntry")
        let predicate = NSPredicate(format: "word == %@ AND dictionary == %@",
                                    argumentArray: [ word, self ])
        request.predicate = predicate
        do {
            let results = try context.executeFetchRequest(request) as! [
                DictionaryEntry ]
            if (results.count == 0) {
                let entry = NSEntityDescription.insertNewObjectForEntityForName("DictionaryEntry",inManagedObjectContext: context) as! DictionaryEntry
                entry.word = word
                entry.dictionary = self
                return entry
            } else {
                return results[ 0 ]
            }
        } catch {
            print("createOrGetDictionaryEntry() fails. Oh no.")
            return nil
        }
    }
}
