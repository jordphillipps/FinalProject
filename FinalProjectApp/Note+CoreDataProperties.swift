//
//  Note+CoreDataProperties.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 04/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var url: String?
    @NSManaged var name: String?

}
