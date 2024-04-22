//
//  Stud_marks+CoreDataProperties.swift
//  Q-1
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
    @NSManaged public var rdbms: Int32
    @NSManaged public var micro: Int32
    @NSManaged public var es: Int32
    @NSManaged public var wd: Int32
    @NSManaged public var toStud: Stud_Mstr?

}

extension Stud_marks : Identifiable {

}
