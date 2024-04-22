//
//  Book+CoreDataProperties.swift
//  Q-2
//
//  Created by Harsh on 10/04/24.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var bookid: Int32
    @NSManaged public var bookname: String?
    @NSManaged public var author: String?
    @NSManaged public var price: Int32
    @NSManaged public var toBookIssueReturn: NSSet?

}

// MARK: Generated accessors for toBookIssueReturn
extension Book {

    @objc(addToBookIssueReturnObject:)
    @NSManaged public func addToToBookIssueReturn(_ value: BookIssueReturn)

    @objc(removeToBookIssueReturnObject:)
    @NSManaged public func removeFromToBookIssueReturn(_ value: BookIssueReturn)

    @objc(addToBookIssueReturn:)
    @NSManaged public func addToToBookIssueReturn(_ values: NSSet)

    @objc(removeToBookIssueReturn:)
    @NSManaged public func removeFromToBookIssueReturn(_ values: NSSet)

}

extension Book : Identifiable {

}
