//
//  NetworkManager.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 25/06/22.
//

import Foundation

class NetWorkManager {
    
    static let shared = NetWorkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getDataFollowers(username: String, page: Int, completion: @escaping([Follower]?, String?) -> Void) {
        
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, "Houve um problema com os dados do usuario, por favor tente novamente.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return completion(nil, "Dados recebidos do server é invalido. Por favor, tente novamente.")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Servidor não esta respondendo. Por favor, tente novamente.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers,nil)
            } catch {
                completion(nil,"Dados recebidos do server é invalido. Por favor, tente novamente.")
            }
        }.resume()
    }
}
