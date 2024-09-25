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

struct Meal: Codable {
    let id: String
    let meal: String
    let thumb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case meal = "strMeal"
        case thumb = "strMealThumb"
    }
}
