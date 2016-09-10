//
//  CompletedToDoItemsController.swift
//  ToDoList
//
//  Created by Monte with Pillow on 9/10/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit

class CompletedToDoItemsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var completedToDoList: [Int:String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedToDoList!.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CompletedCell", forIndexPath: indexPath)
        cell.textLabel?.text = completedToDoList![indexPath.row]
        
        return cell
    }
}
