//
//  MealsInteractor.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/24/24.
//

import Foundation

struct MealsInteractor {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let networkHelper: NetworkHelper
    
    init(
        session: URLSession = URLSession.shared,
        decoder: JSONDecoder = JSONDecoder(),
        networkHelper: NetworkHelper = NetworkHelper()
    ) {
        self.session = session
        self.decoder = decoder
        self.networkHelper = networkHelper
    }
    
    func fetchMeals(for type: MealType) async throws -> [Meal] {
        let path = "/api/json/v1/1/filter.php"
        let queryItems = [
            URLQueryItem(name: "c", value: type.rawValue)
        ]
        
        guard 
            let url = networkHelper.buildURL(path: path, queryItems: queryItems)
        else { throw URLError(.badURL) }
        
        let (data, response) = try await session.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let topLevel = try decoder.decode(MealResponse.self, from: data)
        
        return topLevel.meals
    }
}
