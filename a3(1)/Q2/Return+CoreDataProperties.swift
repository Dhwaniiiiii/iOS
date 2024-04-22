//
//  Return+CoreDataProperties.swift
//  Q2
//
//  Created by MSCICT2 on 4/9/24.
//
//

import Foundation
import CoreData


extension Return {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Return> {
        return NSFetchRequest<Return>(entityName: "Return")
    }

    @NSManaged public var bookid: Int32
    @NSManaged public var status: String?
    @NSManaged public var irdate: String?
    @NSManaged public var returntobook: Book?

}

extension Return : Identifiable {

}
