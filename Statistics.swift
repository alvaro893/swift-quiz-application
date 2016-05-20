//
//  Statistics.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 20.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Statistics: NSManagedObject {
    

    class func createAndGetStatistics(wrongs: Int, corrects: Int) ->Statistics?{

        
        let context = ((UIApplication.sharedApplication().delegate) as!
            AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Statistics")
        let predicate = NSPredicate(format: "wrongs == %@ AND corrects == %@",
                                    argumentArray: [ wrongs, corrects ])
        
        request.predicate = predicate
        do{
            
        let results = try context.executeFetchRequest(request) as! [
            Statistics ]
//        if (results.count == 0) {
            print("Creating new Statistics")
            let statistics = NSEntityDescription.insertNewObjectForEntityForName("Statistics", inManagedObjectContext:context) as! Statistics
            statistics.wrongs = Int32(wrongs)
            statistics.corrects = Int32(wrongs)
            return statistics
//        } else {
//            return results[ 0 ]
//        }
        
            
        }catch {
            print("createOrGetStatistics() fails!!!!")
            return nil
        }
    }
  
    
}
