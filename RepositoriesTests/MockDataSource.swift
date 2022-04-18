//
//  MockDataSource.swift
//  RepositoriesTests
//
//  Created by Rajeev on 19/04/22.
//

import Foundation
@testable import Repositories

enum MockDataError: Error {
    case parsingFailed
}

class MockDataSource: RepositoryDataSourceProtocol {
    
    var completeClosure: ((Result<RepositoryListModel, Error>) -> Void)?
    
    func fetchData(forceFetch: Bool, from urlString: String, completion: @escaping (Result<RepositoryListModel, Error>) -> ()) {
        completeClosure = completion
    }
    
    func fetchMockForSuccessState() {
        guard let path = Bundle(for: type(of: self)).path(forResource: "response", ofType: "json"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)), let model = try? JSONDecoder().decode(RepositoryListModel.self, from: data) else {
            return
        }
        completeClosure?(.success(model))
    }
    
    func fetchMockFail(error: Error) {
        completeClosure?(.failure(error))
    }
    
}
