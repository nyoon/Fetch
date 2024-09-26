//
//  MealDetailsView.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/25/24.
//

import SwiftUI

struct MealDetailsView: View {
    let viewModel: MealDetailsViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    imageView(geometry: geometry)
                    
                    Group {
                        titleView
                        
                        instructionsView
                            .padding(.top, 20)
                        
                        ingedientsView
                            .padding(.top, 20)
                    }
                    .padding(.horizontal, 12)
                }
            }
        }
        .task {
            await viewModel.loadDetails()
        }
    }
    
    // MARK: Views
    
    private var titleView: some View {
        HStack {
            Spacer()
            
            Text(viewModel.name)
                .font(.title)
                .bold()
                .padding(.top, 12)
            
            Spacer()
        }
    }
    
    private var instructionsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Instructions: ")
                .font(.caption)
                .bold()
            
            Text(viewModel.instructions)
                .font(.caption2)
        }
    }
    
    private var ingedientsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ingredients: ")
                .font(.caption)
                .bold()
            
            if let ingredient = viewModel.ingredient1 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient2 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient3 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient4 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient5 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient6 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient7 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient8 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient9 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient10 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient11 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient12 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient13 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient14 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient15 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient16 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient17 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient18 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient19 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
            
            if let ingredient = viewModel.ingredient20 {
                Text("• \(ingredient)")
                    .font(.caption2)
            }
        }
    }
    
    private func imageView(geometry: GeometryProxy) -> some View {
        AsyncImage(url: viewModel.imageUrl) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 200, height: 200)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width, height: geometry.size.height / 3)
                    .aspectRatio(contentMode: .fill)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}
