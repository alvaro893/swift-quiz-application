//
//  Statistics+CoreDataProperties.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 20.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Statistics {

    @NSManaged var wrongs: Int32
    @NSManaged var corrects: Int32

}
