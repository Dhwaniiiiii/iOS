//
//  Marks+CoreDataProperties.swift
//  Q1
//
//  Created by MSCICT2 on 4/8/24.
//
//

import Foundation
import CoreData


extension Marks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Marks> {
        return NSFetchRequest<Marks>(entityName: "Marks")
    }

    @NSManaged public var rollno: Int32
    @NSManaged public var div: String?
    @NSManaged public var rdbms: Int32
    @NSManaged public var micro: Int32
    @NSManaged public var es: Int32
    @NSManaged public var wd: Int32
    @NSManaged public var markstostud: Student?

}

extension Marks : Identifiable {

}
