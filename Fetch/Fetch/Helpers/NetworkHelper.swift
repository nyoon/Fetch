//
//  NetworkHelper.swift
//  Fetch
//
//  Created by Nicholas Yoon on 9/24/24.
//

import Foundation

struct NetworkHelper {
    func buildURL(scheme: String = "https", host: String = "themealdb.com", path: String, queryItems: [URLQueryItem]?) -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}
