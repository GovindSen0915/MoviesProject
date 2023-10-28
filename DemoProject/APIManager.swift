//
//  NetworkManager.swift
//  DemoProject
//
//  Created by Govind Sen on 28/10/23.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<[Movie], DataError>) -> Void

final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func fetchMovies(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.movieSURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
