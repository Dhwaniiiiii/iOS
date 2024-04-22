//
//  Submission+CoreDataProperties.swift
//  Q3
//
//  Created by MSCICT2 on 4/9/24.
//
//

import Foundation
import CoreData


extension Submission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Submission> {
        return NSFetchRequest<Submission>(entityName: "Submission")
    }

    @NSManaged public var assgno: Int32
    @NSManaged public var substatus: String?
    @NSManaged public var subdate: String?
    @NSManaged public var grade: String?
    @NSManaged public var subtoassg: Assignment?

}

extension Submission : Identifiable {

}
