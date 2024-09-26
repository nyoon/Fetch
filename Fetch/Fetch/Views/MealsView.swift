//
//  MealsView.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/25/24.
//

import SwiftUI

struct MealsView: View {
    @Bindable var viewModel: MealsViewModel
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width / 1.2
            
            ZStack {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        hideKeyboard()
                    }
                
                NavigationStack {
                    ZStack {
                        VStack {
                            Text(viewModel.title.capitalized)
                                .font(.system(size: 28, weight: .bold, design: .default))
                                .foregroundColor(.primary)
                                .padding(.bottom, 44)
                                .multilineTextAlignment(.center)
                                .accessibilityAddTraits(.isHeader)
                            
                            ScrollView {
                                TextField("Search \(viewModel.type.rawValue)...", text: $viewModel.searchText)
                                    .frame(width: width)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .onChange(of: viewModel.searchText) {
                                        viewModel.filter()
                                    }
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(alignment: .center) {
                                        ForEach(viewModel.filteredMeals, id: \.id) { meal in
                                            if let thumbUrl = URL(string: meal.thumb) {
                                                NavigationLink(value: meal) {
                                                    MealCard(
                                                        width: width,
                                                        name: meal.name,
                                                        thumbURL: thumbUrl
                                                    )
                                                }
                                            }
                                        }
                                    }
                                }
                                .contentMargins(12, for: .scrollContent)
                                .padding(.top, 8)
                                
                                Spacer()
                            }
                        }
                        .navigationDestination(for: Meal.self) { meal in
                            MealDetailsView(viewModel: MealDetailsViewModel(meal: meal))
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadMeals()
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    MealsView(viewModel: MealsViewModel(type: .dessert))
}
