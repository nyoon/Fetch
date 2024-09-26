//
//  MealDetailsViewModel.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/26/24.
//

import Foundation
import Observation

@Observable class MealDetailsViewModel {
    private let meal: Meal
    private let interactor: MealDetailsInteractor
    
    init(meal: Meal, interactor: MealDetailsInteractor = MealDetailsInteractor()) {
        self.meal = meal
        self.interactor = interactor
    }
    
    private var details: MealDetails?
    
    // MARK: Properties
    
    var name: String {
        return details?.name ?? "N/A"
    }
    
    var imageUrl: URL? {
        guard let details = details else { return nil }

        return URL(string: details.thumb)
    }
    
    var instructions: String {
        return details?.instructions ?? "N/A"
    }
    
    var ingredient1: String? {
        guard
            let details = details,
            let measure = details.measure1,
            let ingredient = details.ingredient1,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient2: String? {
        guard
            let details = details,
            let measure = details.measure2,
            let ingredient = details.ingredient2,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient3: String? {
        guard
            let details = details,
            let measure = details.measure3,
            let ingredient = details.ingredient3,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient4: String? {
        guard
            let details = details,
            let measure = details.measure4,
            let ingredient = details.ingredient4,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient5: String? {
        guard
            let details = details,
            let measure = details.measure5,
            let ingredient = details.ingredient5,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient6: String? {
        guard
            let details = details,
            let measure = details.measure6,
            let ingredient = details.ingredient6,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient7: String? {
        guard
            let details = details,
            let measure = details.measure7,
            let ingredient = details.ingredient7,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient8: String? {
        guard
            let details = details,
            let measure = details.measure8,
            let ingredient = details.ingredient8,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient9: String? {
        guard
            let details = details,
            let measure = details.measure9,
            let ingredient = details.ingredient9,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient10: String? {
        guard
            let details = details,
            let measure = details.measure10,
            let ingredient = details.ingredient10,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient11: String? {
        guard
            let details = details,
            let measure = details.measure11,
            let ingredient = details.ingredient11,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient12: String? {
        guard
            let details = details,
            let measure = details.measure12,
            let ingredient = details.ingredient12,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient13: String? {
        guard
            let details = details,
            let measure = details.measure13,
            let ingredient = details.ingredient13,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient14: String? {
        guard
            let details = details,
            let measure = details.measure14,
            let ingredient = details.ingredient14,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient15: String? {
        guard
            let details = details,
            let measure = details.measure15,
            let ingredient = details.ingredient15,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient16: String? {
        guard
            let details = details,
            let measure = details.measure16,
            let ingredient = details.ingredient16,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient17: String? {
        guard
            let details = details,
            let measure = details.measure17,
            let ingredient = details.ingredient17,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient18: String? {
        guard
            let details = details,
            let measure = details.measure18,
            let ingredient = details.ingredient18,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient19: String? {
        guard
            let details = details,
            let measure = details.measure19,
            let ingredient = details.ingredient19,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    var ingredient20: String? {
        guard
            let details = details,
            let measure = details.measure20,
            let ingredient = details.ingredient20,
            !measure.isEmpty,
            !ingredient.isEmpty
        else { return nil }
        
        
        return "\(measure) of \(ingredient)"
    }
    
    // MARK: Fetch
    
    func loadDetails() async {
        do {
            self.details = try await interactor.fetchMealDetails(id: meal.id)
        } catch {
            print(error)
        }
    }
}
