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
            NavigationStack {
                VStack {
                    Text(viewModel.title.capitalized)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(.primary)
                        .padding(.bottom, 10)
                        .multilineTextAlignment(.center)
                        .accessibilityAddTraits(.isHeader)
                    
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
                                        .navigationDestination(for: Meal.self) { meal in
                                            MealDetailsView(viewModel: MealDetailsViewModel(meal: meal))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .contentMargins(12, for: .scrollContent)
                    
                    Spacer()
                }
            }
        }
        .task {
            await viewModel.loadMeals()
        }
    }
}

struct MealCard: View {
    let width: CGFloat
    let name: String
    let thumbURL: URL
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            CircularImageView(
                imageURL: thumbURL,
                width: width,
                height: width
            )
            
            Text(name)
                .frame(maxWidth: width)
                .lineLimit(0)
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
        .padding([.horizontal, .vertical], 12)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 5)  // Border with color and width
        )
    }
}


struct CircularImageView: View {
    let imageURL: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Circle())
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4)
                    )
            case .failure:
                Circle()
                    .frame(width: width, height: height)
                    .background(Color.gray.opacity(0.3))
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    MealsView(viewModel: MealsViewModel(type: .dessert))
}
