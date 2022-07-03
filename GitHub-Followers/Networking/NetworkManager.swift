//
//  NetworkManager.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 25/06/22.
//

import UIKit

typealias NetworkResult = (Result<[Follower], ErrorMessage>)

class NetWorkManager {
        
    static let shared = NetWorkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getDataFollowers(username: String, page: Int, completion: @escaping(NetworkResult) -> Void) {
        
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            return completion(.failure(.invalidResponse))
            
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completion(.failure(.invalidResponse))
                
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}
