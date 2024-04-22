//
//  Stud+CoreDataProperties.swift
//  Crud_Practise
//
//  Created by MSCICT2 on 09/04/24.
//
//

import Foundation
import CoreData


extension Stud {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stud> {
        return NSFetchRequest<Stud>(entityName: "Stud")
    }

    @NSManaged public var srn: Int32
    @NSManaged public var sname: String?
    @NSManaged public var sage: Int32
    @NSManaged public var toMarks: NSSet?

}

// MARK: Generated accessors for toMarks
extension Stud {

    @objc(addToMarksObject:)
    @NSManaged public func addToToMarks(_ value: Marks)

    @objc(removeToMarksObject:)
    @NSManaged public func removeFromToMarks(_ value: Marks)

    @objc(addToMarks:)
    @NSManaged public func addToToMarks(_ values: NSSet)

    @objc(removeToMarks:)
    @NSManaged public func removeFromToMarks(_ values: NSSet)

}

extension Stud : Identifiable {

}
