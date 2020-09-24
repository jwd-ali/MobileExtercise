//
//  TrendingRepositories.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation

protocol SegrigatedRespostries {
    var author: String { get }
    var name: String { get }
    var stars: Int { get }
    var language: String { get }
    var trendingRepositoryDescription: String { get }
    var languageColor: String { get }
    var avatar: String { get }
}

// MARK: - TrendingRepository
struct TrendingRepository: Codable,SegrigatedRespostries {
    let author, name: String
    let avatar: String
    let url: String
    let trendingRepositoryDescription, language, languageColor: String
    let stars, forks, currentPeriodStars: Int
    let builtBy: [BuiltBy]

    enum CodingKeys: String, CodingKey {
        case author, name, avatar, url
        case trendingRepositoryDescription = "description"
        case language, languageColor, stars, forks, currentPeriodStars, builtBy
    }
}

// MARK: - BuiltBy
struct BuiltBy: Codable {
    let username: String
    let href, avatar: String
}

typealias TrendingRepositories = [TrendingRepository]
