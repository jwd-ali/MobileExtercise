//
//  TrendingRepository.swift
//  MobileExercise
//
//  Created by Jawad Ali on 24/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation

protocol TrendRepositoryType {
    func getDailyTrendingRespositories(completion: @escaping(Result<TrendingRepositories?,AppError>)-> Void)
}

class TrendRepository: TrendRepositoryType {
    func getDailyTrendingRespositories(completion: @escaping(Result<TrendingRepositories?,AppError>)-> Void) {
        RepositoriesService().fetchTrendingRespostries(for: "", period: "daily", completion: completion)
    }
}

class TrendRepositoryMocked: TrendRepositoryType {
    func getDailyTrendingRespositories(completion: @escaping(Result<TrendingRepositories?,AppError>)-> Void) {
        completion(.success(TrendingRepository.mocked))
    }
}
