//
//  AddToDoItemController.swift
//  ToDoList
//
//  Created by Monte with Pillow on 9/7/16.
//  Copyright © 2016 Monte Thakkar. All rights reserved.
//

import UIKit

protocol AddToDoItemControllerDelegate: class {
    func addToDoItemToList(text:String)
}

class AddToDoItemController: UIViewController {
    
    @IBOutlet weak var toDoItemField: UITextField!
    
    weak var delegate: AddToDoItemControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBarButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveBarButtonPressed(sender: AnyObject) {
        delegate?.addToDoItemToList(toDoItemField.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
