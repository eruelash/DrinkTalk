//
//  Cocktail.swift
//  Cocktails
//
//  Created by David Dunne on 19/08/2021.
//

import Foundation
import SwiftUI

struct Cocktail: Hashable, Codable {
    var idDrink: String
    var strDrink: String
    var strInstructions: String
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    
    var strDrinkThumb: String
    
    struct IngredientAndMeasure: Identifiable {
        var id = UUID()
        var ingredient: String
        var measure: String
    }
    
    func ingredientsAndMeasures() -> [IngredientAndMeasure] {
        let ingredients = [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15]
        let measures = [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15]
        var ingredientsAndMeasures = [IngredientAndMeasure]()
        
        for index in 0...14 {
            if(ingredients[index] == nil || measures[index] == nil) {
                break
            }
            else {
                let ingredientAndMeasure = IngredientAndMeasure(ingredient: ingredients[index] ?? "", measure: measures[index] ?? "")
                ingredientsAndMeasures.append(ingredientAndMeasure)
            }
        }
        return ingredientsAndMeasures
    }
    
}
