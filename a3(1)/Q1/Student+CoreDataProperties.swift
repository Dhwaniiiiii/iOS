//
//  Student+CoreDataProperties.swift
//  Q1
//
//  Created by MSCICT2 on 4/8/24.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var rollno: Int32
    @NSManaged public var name: String?
    @NSManaged public var div: String?
    @NSManaged public var sem: String?
    @NSManaged public var area: String?
    @NSManaged public var city: String?
    @NSManaged public var dob: String?
    @NSManaged public var bgp: String?
    @NSManaged public var gender: String?
    @NSManaged public var studtomarks: NSSet?

}

// MARK: Generated accessors for studtomarks
extension Student {

    @objc(addStudtomarksObject:)
    @NSManaged public func addToStudtomarks(_ value: Marks)

    @objc(removeStudtomarksObject:)
    @NSManaged public func removeFromStudtomarks(_ value: Marks)

    @objc(addStudtomarks:)
    @NSManaged public func addToStudtomarks(_ values: NSSet)

    @objc(removeStudtomarks:)
    @NSManaged public func removeFromStudtomarks(_ values: NSSet)

}

extension Student : Identifiable {

}
