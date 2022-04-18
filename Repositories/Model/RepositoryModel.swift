//
//  RepositoryModel.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

struct RepositoryOwner: Codable {
    var name: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageUrl = "avatar_url"
    }
}

struct RepositoryModel: Codable {
    var id: Int?
    var name: String?
    var owner: RepositoryOwner?
    var description: String?
    var language: String?
    var forksCount: String?
    var starGazersCount: String?
    
    var ownerName: String? {
        return owner?.name
    }
    
    var imageUrl: String? {
        return owner?.imageUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, language
        case forksCount = "forks_count"
        case starGazersCount = "stargazers_count"
        var owner = "owner"
    }
}
