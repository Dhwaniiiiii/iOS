//
//  BookIssueReturn+CoreDataProperties.swift
//  Q-2
//
//  Created by Harsh on 10/04/24.
//
//

import Foundation
import CoreData


extension BookIssueReturn {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookIssueReturn> {
        return NSFetchRequest<BookIssueReturn>(entityName: "BookIssueReturn")
    }

    @NSManaged public var bookid: Int32
    @NSManaged public var status: String?
    @NSManaged public var irdate: String?
    @NSManaged public var toBook: Book?

}

extension BookIssueReturn : Identifiable {

}
