//
//  Meal.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/24/24.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

struct Meal: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let thumb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumb = "strMealThumb"
    }
}
