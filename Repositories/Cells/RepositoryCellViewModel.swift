//
//  RepositoryCellViewModel.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

class RepositoryCellViewModel {
    let ownerName: String?
    let avtarImageUrlString: String?
    let name: String?
    let description: String?
    let language: String?
    let forksCount: Int?
    let starGazersCount: Int?
    private(set) var hasCollapsed = true
    
    var avtarImageUrl: URL? {
        guard let avtarImageUrlString = avtarImageUrlString else { return nil }
        return URL(string: avtarImageUrlString)
    }
    
    init(repositoryModel: RepositoryModel) {
        self.ownerName = repositoryModel.owner?.name
        self.avtarImageUrlString = repositoryModel.owner?.imageUrl
        self.name = repositoryModel.name
        self.description = repositoryModel.description
        self.language = repositoryModel.language
        self.forksCount = repositoryModel.forksCount
        self.starGazersCount = repositoryModel.starGazersCount
    }
    
    func setCollapsibleState(hasCollapsed: Bool) {
        self.hasCollapsed = hasCollapsed
    }
}
