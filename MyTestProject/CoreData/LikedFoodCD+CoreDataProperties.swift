//
//  LikedFoodCD+CoreDataProperties.swift
//  MyTestProject
//
//  Created by Max Stovolos on 12/21/22.
//
//

import Foundation
import CoreData


extension LikedFoodCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LikedFoodCD> {
        return NSFetchRequest<LikedFoodCD>(entityName: "LikedFoodCD")
    }

    @NSManaged public var calories: Double
    @NSManaged public var recipeAuthor: String?
    @NSManaged public var recipeImage: String?
    @NSManaged public var recipeName: String?
    @NSManaged public var totalTime: Double
    @NSManaged public var totalWeight: Double
    @NSManaged public var likedIngredients: NSSet?

}

// MARK: Generated accessors for likedIngredients
extension LikedFoodCD {

    @objc(addLikedIngredientsObject:)
    @NSManaged public func addToLikedIngredients(_ value: LikedIngredientCD)

    @objc(removeLikedIngredientsObject:)
    @NSManaged public func removeFromLikedIngredients(_ value: LikedIngredientCD)

    @objc(addLikedIngredients:)
    @NSManaged public func addToLikedIngredients(_ values: NSSet)

    @objc(removeLikedIngredients:)
    @NSManaged public func removeFromLikedIngredients(_ values: NSSet)

}

extension LikedFoodCD : Identifiable {

}
