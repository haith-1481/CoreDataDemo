//
//  Person.swift
//  CoreDataDemo
//
//  Created by trinh.hoang.hai on 3/26/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import Foundation

class Persons: NSObject {
    var id: String?
    var name: String?

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
