//
//  Stud_master+CoreDataProperties.swift
//  ps3Q1
//
//  Created by MSCICT2 on 08/04/24.
//
//

import Foundation
import CoreData


extension Stud_master {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stud_master> {
        return NSFetchRequest<Stud_master>(entityName: "Stud_master")
    }

    @NSManaged public var rollno: Int32
    @NSManaged public var sem: String?
    @NSManaged public var div: String?
    @NSManaged public var name: String?
    @NSManaged public var area: String?
    @NSManaged public var city: String?
    @NSManaged public var dob: String?
    @NSManaged public var bgp: String?
    @NSManaged public var gender: String?
    @NSManaged public var toMarks: NSSet?

}

// MARK: Generated accessors for toMarks
extension Stud_master {

    @objc(addToMarksObject:)
    @NSManaged public func addToToMarks(_ value: Stud_marks)

    @objc(removeToMarksObject:)
    @NSManaged public func removeFromToMarks(_ value: Stud_marks)

    @objc(addToMarks:)
    @NSManaged public func addToToMarks(_ values: NSSet)

    @objc(removeToMarks:)
    @NSManaged public func removeFromToMarks(_ values: NSSet)

}

extension Stud_master : Identifiable {

}
