//
//  MealsViewModel.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/26/24.
//

import Observation

@Observable class MealsViewModel {
    var meals: [Meal] = []
    
    private let interactor: MealsInteractor
    
    init(interactor: MealsInteractor = MealsInteractor()) {
        self.interactor = interactor
    }
    
    func loadMeals() async {
        do {
            let meals = try await interactor.fetchMeals(for: .dessert)
            let sorted = meals.sorted(by: { $0.name < $1.name })
            
            self.meals = sorted
        } catch {
            print(error)
        }
    }
}
