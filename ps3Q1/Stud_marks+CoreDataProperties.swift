//
//  Stud_marks+CoreDataProperties.swift
//  ps3Q1
//
//  Created by MSCICT2 on 08/04/24.
//
//

import Foundation
import CoreData


extension Stud_marks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stud_marks> {
        return NSFetchRequest<Stud_marks>(entityName: "Stud_marks")
    }

    @NSManaged public var rollno: Int32
    @NSManaged public var div: String?
    @NSManaged public var rdbms: Int32
    @NSManaged public var micro: Int32
    @NSManaged public var es: Int32
    @NSManaged public var wd: Int32
    @NSManaged public var toMaster: Stud_master?

}

extension Stud_marks : Identifiable {

}
