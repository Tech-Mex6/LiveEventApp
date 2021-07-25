//
//  NetworkManager.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/22/21.
//

import UIKit
//app secret = "e7781f61fb3730287234e7a5d19237e199c4245ca7528af404fe2bc5d35c3822"
//app id     =     MjI2MzAyMzh8MTYyNjk5ODc4Ny4yOTU1NDMy

class NetworkManager {
    static let shared   = NetworkManager()
    private let baseUrl = "https://api.seatgeek.com/2/events?"
    let clientID        = "MjI2MzAyMzh8MTYyNjk5ODc4Ny4yOTU1NDMy"
    let cache           = NSCache<NSString, UIImage>()
    
    private init(){}
    
    func getEvents(page: Int, completed: @escaping (Result<[Event], LEError>) -> Void) {
        let endPoint = baseUrl + "per_page=25&page=\(page)" + "client_id=\(clientID)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let events = try decoder.decode([Event].self, from: data)
                completed(.success(events))
            }catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
            error == nil,
            let response   = response as? HTTPURLResponse, response.statusCode == 200,
            let data       = data,
            let image      = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

