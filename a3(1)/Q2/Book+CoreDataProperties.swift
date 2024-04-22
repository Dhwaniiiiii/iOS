//
//  Book+CoreDataProperties.swift
//  Q2
//
//  Created by MSCICT2 on 4/9/24.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var bookId: Int32
    @NSManaged public var bookname: String?
    @NSManaged public var author: String?
    @NSManaged public var price: String?
    @NSManaged public var booktoreturn: NSSet?

}

// MARK: Generated accessors for booktoreturn
extension Book {

    @objc(addBooktoreturnObject:)
    @NSManaged public func addToBooktoreturn(_ value: Return)

    @objc(removeBooktoreturnObject:)
    @NSManaged public func removeFromBooktoreturn(_ value: Return)

    @objc(addBooktoreturn:)
    @NSManaged public func addToBooktoreturn(_ values: NSSet)

    @objc(removeBooktoreturn:)
    @NSManaged public func removeFromBooktoreturn(_ values: NSSet)

}

extension Book : Identifiable {

}
