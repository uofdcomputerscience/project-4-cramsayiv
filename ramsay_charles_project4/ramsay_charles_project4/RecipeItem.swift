//
//  RecipeItem.swift
//  ramsay_charles_project4
//
//  Created by Charles Ramsay on 12/16/19.
//  Copyright © 2019 Charles Ramsay. All rights reserved.
//

import Foundation


struct MyIngredient: Codable {
        let amount: String?
        let name: String?
        let unit: String?
    }

struct MyIngredientGroup: Codable {
    let name: String?
    let ingredient: [MyIngredient]
}

struct MyStep: Codable {
    let description: String
}

struct RecipeItem: Codable {
    let name: String
    let id: String
    let description: String?
    let tag: [String]
    let ingredient: [MyIngredient]
    let ingredientGroup: [MyIngredientGroup]?
    let step: [MyStep]
    let forked: String?
    var image: String

    var MyImageURL: URL? {
        return URL(string: image)
}
}
