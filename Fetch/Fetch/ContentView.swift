//
//  ContentView.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
//            Task {
//                do {
//                    let meals = try await MealsInteractor().fetchMeals(for: .dessert)
//                    print(meals)
//                } catch {
//                    print(error)
//                }
//            }
            
//            Task {
//                do {
//                    let details = try await MealDetailsInteractor().fetchMealDetails(id: "52768")
//                    print(details)
//                } catch {
//                    print(error)
//                }
//            }
        }
    }
}

#Preview {
    ContentView()
}



