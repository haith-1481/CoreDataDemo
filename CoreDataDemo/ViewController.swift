//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by trinh.hoang.hai on 3/26/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var userList = [Persons]()

    @IBAction func addPerson(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

