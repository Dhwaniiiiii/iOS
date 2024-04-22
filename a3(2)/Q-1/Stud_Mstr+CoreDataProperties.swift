//
//  Stud_Mstr+CoreDataProperties.swift
//  Q-1
//
//  Created by MSCICT2 on 08/04/24.
//
//

import Foundation
import CoreData


extension Stud_Mstr {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stud_Mstr> {
        return NSFetchRequest<Stud_Mstr>(entityName: "Stud_Mstr")
    }

    @NSManaged public var rollno: Int32
    @NSManaged public var sem: Int32
    @NSManaged public var div: String?
    @NSManaged public var name: String?
    @NSManaged public var area: String?
    @NSManaged public var city: String?
    @NSManaged public var dob: Int32
    @NSManaged public var gender: String?
    @NSManaged public var toMarks: NSSet?

}

// MARK: Generated accessors for toMarks
extension Stud_Mstr {

    @objc(addToMarksObject:)
    @NSManaged public func addToToMarks(_ value: Stud_marks)

    @objc(removeToMarksObject:)
    @NSManaged public func removeFromToMarks(_ value: Stud_marks)

    @objc(addToMarks:)
    @NSManaged public func addToToMarks(_ values: NSSet)

    @objc(removeToMarks:)
    @NSManaged public func removeFromToMarks(_ values: NSSet)

}

extension Stud_Mstr : Identifiable {

}
