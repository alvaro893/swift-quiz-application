//
//  DictionaryTableViewController.swift
//  lab5-quiz
//
//  Created by Álvaro Bolaños Rodríguez on 17.5.2016.
//  Copyright © 2016 Álvaro Bolaños Rodríguez. All rights reserved.
//

import UIKit
import CoreData

class DictionaryTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var addButton: UINavigationItem!
    
    let entitiyName = "DictionaryEntry"
    let cellId = "cell"
    let addEntry = "addEntry"
    let showSynonyms = "showSynonyms"
    let showEdit = "showEdit"
    var dictionary: Dictionary?
    var fetchedResultsController: NSFetchedResultsController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //set up fetched data
        fetchAndUpdateData()
        
        // testing reload of table
        addOneWord("table", synonyms: ["pyötä"])

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: NSFetchedResultsControllerDelegate methods
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
       tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSections = 1
        if let sections = fetchedResultsController?.sections {
            numberOfSections = sections.count
        }
        return numberOfSections
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController!.sections![section].numberOfObjects
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = (tableView.dequeueReusableCellWithIdentifier(cellId) as? DictionaryTableViewCell)
        
        if cell == nil {
            cell = DictionaryTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        
        let dictionary = fetchedResultsController!.objectAtIndexPath(indexPath)
        
        cell?.wordLabel.text = dictionary.valueForKey("word") as? String
        //cell?.editButton.addTarget(self, action: #selector(DictionaryTableViewController.editButtonAction), forControlEvents: .TouchUpInside)


        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == addEntry {
            print("adding new entry...")
            
        } else if segue.identifier == showSynonyms {
            print("show synonyms")
        } else if segue.identifier == showEdit {
            print ("editing entry")
            let entryViewController = segue.destinationViewController as! EntryViewController
            if let selectedWordCell = sender as? EntryViewController {
                entryViewController.word = "test"
                entryViewController.synonymArray = nil
            }
        }
    }
    
    @IBAction func unwindToEntryViewController(sender: UIStoryboardSegue){
        if let source = sender.sourceViewController as? EntryViewController {
            print("unwindToEntryViewController called")
            // add entry from entry controller
            addOneWord(source.word!, synonyms: source.synonymArray!)
        }
    }
 
    
    
    // MARK: - Database
    
    func addOneWord(word: String, synonyms: [String]){
        self.dictionary = Dictionary.createOrGetDictionaryFrom("eng", to: "fin")
        let entry = dictionary?.createOrGetDictionaryEntry(word)
        for synonym in synonyms {
            entry?.addSynonym(synonym)
        }
    }
    
    
    
    func fetchAndUpdateData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: self.entitiyName)
        let sortDescriptor = NSSortDescriptor(key: "word", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController!.delegate = self
        
        do{
            try fetchedResultsController!.performFetch()
        }catch let error as NSError{
            print ("Could not fetch \(error), \(error.userInfo)")
        }
    }

}
