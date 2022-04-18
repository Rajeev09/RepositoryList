//
//  RepositoryListViewModel.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

class RepositoryListViewModel {
    
    private let url = "https://api.github.com/search/repositories?q=ios&per_page=50&sort=stars&page=1&order=desc&since=daily"
    
    var cellModels = [RepositoryCellViewModel]()
    private let repositoryDataSource: RepositoryDataSourceProtocol
    
    let viewState: Observable<ViewState> = Observable(.Loading)

    
    init(repositoryDataSource: RepositoryDataSourceProtocol) {
        self.repositoryDataSource = repositoryDataSource
    }
    
    func fetchRepositories(forceFetch: Bool) {
        self.viewState.value = .Loading
        self.repositoryDataSource.fetchData(forceFetch: forceFetch, from: url) { [weak self] result in
            guard let self = self else { return }
            self.viewState.value = .Loaded
            switch result {
            case .success(let modelList):
                self.cellModels = modelList.items?.map { RepositoryCellViewModel(repositoryModel: $0) } ?? []
                self.viewState.value = .Loaded
            case .failure(let error):
                self.viewState.value = .Error(error)
            }
        }
    }
    
}

//Table View Helpers
extension RepositoryListViewModel {
    func getRepositoryCellModelCount() -> Int {
        return self.cellModels.count
    }
    
    func getRepositoryCellModel(index: Int) -> RepositoryCellViewModel {
        return cellModels[index]
    }
    
    func setCollapsibleState(index: Int) {
        cellModels.forEach { $0.setCollapsibleState(hasCollapsed: true) }
        let cellModel = cellModels[index]
        cellModel.setCollapsibleState(hasCollapsed: !cellModel.hasCollapsed)
    }
}
