//
//  Marks+CoreDataProperties.swift
//  Crud_Practise
//
//  Created by MSCICT2 on 09/04/24.
//
//

import Foundation
import CoreData


extension Marks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Marks> {
        return NSFetchRequest<Marks>(entityName: "Marks")
    }

    @NSManaged public var sem1: Int32
    @NSManaged public var sem2: Int32
    @NSManaged public var sem3: Int32
    @NSManaged public var toStud: Stud?

}

extension Marks : Identifiable {

}
