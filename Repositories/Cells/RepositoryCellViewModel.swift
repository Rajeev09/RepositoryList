//
//  RepositoryCellViewModel.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

class RepositoryCellViewModel {
    let ownerName: String?
    let avtarImageUrl: String?
    let name: String?
    let description: String?
    let language: String?
    let forksCount: Int?
    let starGazersCount: Int?
    
    init(repositoryModel: RepositoryModel) {
        self.ownerName = repositoryModel.owner?.name
        self.avtarImageUrl = repositoryModel.owner?.imageUrl
        self.name = repositoryModel.name
        self.description = repositoryModel.description
        self.language = repositoryModel.language
        self.forksCount = repositoryModel.forksCount
        self.starGazersCount = repositoryModel.starGazersCount
    }
}
