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

extension TrendingRepository {
    static var mocked: [TrendingRepository] {
        return [TrendingRepository(author: "Jawad", name: "JTabBar", avatar: "https://avatars2.githubusercontent.com/u/53082328?s=460&u=d23c2dcc46397e42b3e3eb41b6e7089e8b18e64e&v=4", url: "https://github.com/jwd-ali/Switch-Animations", trendingRepositoryDescription: "", language: "swift", languageColor: "#00ADD8", stars: 67, forks: 8, currentPeriodStars: 7, builtBy: [BuiltBy(username: "jawad", href: "", avatar: "")]),TrendingRepository(author: "Janbaz", name: "ATabBar", avatar: "https://avatars2.githubusercontent.com/u/53082328?s=460&u=d23c2dcc46397e42b3e3eb41b6e7089e8b18e64e&v=4", url: "https://github.com/jwd-ali/Switch-Animations", trendingRepositoryDescription: "", language: "swift", languageColor: "#ffac45", stars: 167, forks: 8, currentPeriodStars: 17, builtBy: [BuiltBy(username: "usman", href: "", avatar: "")])]
    }
}
