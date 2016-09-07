//
//  ViewController.swift
//  ToDoList
//
//  Created by Monte with Pillow on 9/6/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let toDoList: [Int:String] = [0: "Go get groceries", 1: "Walk the dog", 2: "Watch a movie", 3: "Do your homework"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }

}

