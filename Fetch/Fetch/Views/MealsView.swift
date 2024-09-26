//
//  MealsView.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/25/24.
//

import SwiftUI

struct MealsView: View {
    var viewModel = MealsViewModel()
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width / 1.2
            
            ScrollView(.horizontal) {
                VStack {
                    Spacer()
                    
                    HStack(alignment: .center) {
                        ForEach(viewModel.meals, id: \.id) { meal in
                            if let thumbUrl = URL(string: meal.thumb) {
                                MealCard(
                                    width: width,
                                    name: meal.name,
                                    thumbURL: thumbUrl
                                )
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .contentMargins(12, for: .scrollContent)
        }
        .onAppear {
            Task {
                await viewModel.loadMeals()
            }
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
    MealsView()
}
