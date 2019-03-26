//
//  CatManageViewController.swift
//  CoreDataDemo
//
//  Created by trinh.hoang.hai on 3/26/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class CatManageViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var raceTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addCat(_ sender: Any) {

    }
}

extension CatManageViewController: UITableViewDelegate, UITableViewDataSource {

}
