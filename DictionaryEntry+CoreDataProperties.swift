//
//  DictionaryEntry+CoreDataProperties.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 17.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DictionaryEntry {

    @NSManaged var word: String
    @NSManaged var dictionary: Dictionary
    @NSManaged var synonyms: Set<Synonym>

}
