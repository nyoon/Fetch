//
//  MealsViewModel.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/26/24.
//

import Observation

@Observable class MealsViewModel {
    var searchText: String = ""
    var filteredMeals: [Meal] = []
    let type: MealType
    
    let title = "Sweet Things"
    
    private var meals: [Meal] = []
    private let interactor: MealsInteractor
    
    init(type: MealType, interactor: MealsInteractor = MealsInteractor()) {
        self.type = type
        self.interactor = interactor
    }
    
    // MARK: Fetch
    
    func loadMeals() async {
        do {
            let meals = try await interactor.fetchMeals(for: type)
            let sorted = meals.sorted(by: { $0.name < $1.name })
            
            self.meals = sorted
            self.filteredMeals = sorted
        } catch {
            print(error)
        }
    }
    
    func filter() {
        if searchText.isEmpty {
            self.filteredMeals = meals
        } else {
            self.filteredMeals = meals.filter { $0.name.lowercased().contains(searchText.lowercased())}
        }
    }
}
