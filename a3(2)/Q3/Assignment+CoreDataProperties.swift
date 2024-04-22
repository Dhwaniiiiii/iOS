//
//  Assignment+CoreDataProperties.swift
//  Q3
//
//  Created by MSCICT2 on 4/9/24.
//
//

import Foundation
import CoreData


extension Assignment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assignment> {
        return NSFetchRequest<Assignment>(entityName: "Assignment")
    }

    @NSManaged public var assgno: Int32
    @NSManaged public var assgdate: String?
    @NSManaged public var subject: String?
    @NSManaged public var faculty: String?
    @NSManaged public var assgtosub: NSSet?

}

// MARK: Generated accessors for assgtosub
extension Assignment {

    @objc(addAssgtosubObject:)
    @NSManaged public func addToAssgtosub(_ value: Submission)

    @objc(removeAssgtosubObject:)
    @NSManaged public func removeFromAssgtosub(_ value: Submission)

    @objc(addAssgtosub:)
    @NSManaged public func addToAssgtosub(_ values: NSSet)

    @objc(removeAssgtosub:)
    @NSManaged public func removeFromAssgtosub(_ values: NSSet)

}

extension Assignment : Identifiable {

}
