//
//  ViewController.swift
//  ToDoList
//
//  Created by Monte with Pillow on 9/6/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddToDoItemControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var toDoList: NSMutableArray = ["Go get groceries", "Walk the dog", "Watch a movie", "Do your homework"]
    var completedToDoList: [Int:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        resetAccessoryType()
        
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row] as? String
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func addToDoItemToList(text:String) {
        toDoList[toDoList.count] = text
        
        tableView.reloadData()
    }
    
    func resetAccessoryType() {
        for (var row = 0; row < toDoList.count; row += 1) {
            print(row)
            if let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0)) {
                print("here")
                cell.accessoryType = UITableViewCellAccessoryType.None
                cell.selectionStyle = UITableViewCellSelectionStyle.None
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if (cell.accessoryType == .Checkmark) {
                cell.accessoryType = .None
            } else {
                cell.accessoryType = .Checkmark
                completedToDoList[(completedToDoList.count)] = toDoList[indexPath.row] as! String
                toDoList.removeObjectAtIndex(indexPath.row)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "AddToDoItemSegue") {
            let navigationController = segue.destinationViewController as! UINavigationController
            let addToDoItemViewController = navigationController.topViewController as! AddToDoItemController
            
            addToDoItemViewController.delegate = self
        } else if(segue.identifier == "CompletedToDoItemsSegue") {
            let completedToDoItemsController = segue.destinationViewController as! CompletedToDoItemsController
            
            completedToDoItemsController.completedToDoList = completedToDoList
        }
    }

}

