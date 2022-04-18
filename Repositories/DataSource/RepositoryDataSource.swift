//
//  RepositoryDataSource.swift
//  Repositories
//
//  Created by Rajeev on 19/04/22.
//

import Foundation

protocol RepositoryDataSourceProtocol {
    func fetchData(forceFetch: Bool, from urlString: String, completion: @escaping (Result<RepositoryListModel, Error>) -> ())
}

class RepositoryDataSource: RepositoryDataSourceProtocol {
    
    let networkManager: DataSourceProtocol
    
    init(networkManager: DataSourceProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchData(forceFetch: Bool, from urlString: String, completion: @escaping (Result<RepositoryListModel, Error>) -> ()) {
        self.networkManager.fetchData(forceFetch: forceFetch, from: urlString) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    
}
