//
//  RepositoryModel.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

struct RepositoryListModel: Codable {
    var items: [RepositoryModel]?
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

struct RepositoryModel: Codable {
    var id: Int?
    var name: String?
    var owner: RepositoryOwner?
    var description: String?
    var language: String?
    var forksCount: Int?
    var starGazersCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, language, owner, description
        case forksCount = "forks_count"
        case starGazersCount = "stargazers_count"
    }
}

struct RepositoryOwner: Codable {
    var name: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageUrl = "avatar_url"
    }
}
