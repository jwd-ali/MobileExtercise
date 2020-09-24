//
//  RepositoriesService.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
protocol RepositoriesService {
    func fetchTrendingRespostries(for language:String, period:String, completion: @escaping(Result<TrendingRepositories?,AppError>) -> Void)
}

class RepositoriesServiceImp: RepositoriesService {
    private let apiConvertible:ApiService = APIClient()
    
    func fetchTrendingRespostries(for language:String, period:String, completion: @escaping(Result<TrendingRepositories?,AppError>) -> Void) {
        
        let request = TrendingRespostriesRequest(since: period, language: language)
        let router = Router.getTrendingRespostries(request)
        apiConvertible.performRequest(router: router) { (result:Result<TrendingRepositories, AppError>) in
            
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
                
            }
        }
    }
}
