//
//  NetworkManager.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

class NetworkManager {
    
    let shared = NetworkManager()
    
    private init() {
        
    }
    
    private let allowedDiskSize = 100 * 1024 * 1024
    private lazy var cache: URLCache = {
        return URLCache(memoryCapacity: 0, diskCapacity: allowedDiskSize, diskPath: "dataCache")
    }()
    
    private lazy var session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
        sessionConfiguration.urlCache = cache
        return URLSession(configuration: sessionConfiguration)
    }()
    
    func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T,Error>) -> ()) {
        guard let downloadUrl = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: downloadUrl)
        // First try to fetching cached data if exist
        if let cachedData = self.cache.cachedResponse(for: urlRequest) {
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: cachedData.data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(error))
            }
            
        } else {
            // No cached data, download content than cache the data
            session.dataTask(with: urlRequest) { (data, response, error) in
                
                if let error = error {
                    completion(.failure(error))
                } else {
                    
                    let cachedData = CachedURLResponse(response: response!, data: data!)
                    self.cache.storeCachedResponse(cachedData, for: urlRequest)
                    do {
                        let jsonData = try JSONDecoder().decode(T.self, from: cachedData.data)
                        completion(.success(jsonData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
}
