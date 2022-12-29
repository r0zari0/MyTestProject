//
//  LikedIngredientCD+CoreDataProperties.swift
//  MyTestProject
//
//  Created by Max Stovolos on 12/29/22.
//
//

import Foundation
import CoreData


extension LikedIngredientCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LikedIngredientCD> {
        return NSFetchRequest<LikedIngredientCD>(entityName: "LikedIngredientCD")
    }

    @NSManaged public var image: String?
    @NSManaged public var text: String?
    @NSManaged public var likedIngredientCD: NSSet?

}

// MARK: Generated accessors for likedIngredientCD
extension LikedIngredientCD {

    @objc(addLikedIngredientCDObject:)
    @NSManaged public func addToLikedIngredientCD(_ value: LikedFoodCD)

    @objc(removeLikedIngredientCDObject:)
    @NSManaged public func removeFromLikedIngredientCD(_ value: LikedFoodCD)

    @objc(addLikedIngredientCD:)
    @NSManaged public func addToLikedIngredientCD(_ values: NSSet)

    @objc(removeLikedIngredientCD:)
    @NSManaged public func removeFromLikedIngredientCD(_ values: NSSet)

}

extension LikedIngredientCD : Identifiable {

}
