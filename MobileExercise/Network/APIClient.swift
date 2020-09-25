//
//  APIClient.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
public protocol ApiService {
    func performRequest<T:Codable>(router: URLRequestConvertible, completionHandler: @escaping (Result<T,AppError>) -> Void)
}

public class APIClient {
    private let session = URLSession(configuration: .default)
    private func fetchFeed(request : URLRequest?, completion:@escaping (Result<Data,AppError>) -> Void) {
        
        guard let url = request?.url else {
            let error = AppError(error: "Not a valid Url")
            completion(.failure(error))
            return
        }
        
        let task = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(AppError.init(error: error.localizedDescription)))
            }
        }
        task.resume()
        
    }
}
extension APIClient:ApiService {
    public func performRequest<T:Codable>(router: URLRequestConvertible, completionHandler: @escaping (Result<T,AppError>) -> Void) {
        
        if !Reachability.isConnectedToNetwork() { completionHandler(.failure(AppError(error: "Network is Busy", isNetworkError: true)))
            return
        }
        
        self.fetchFeed(request: router.urlRequest()) { result in
            switch result {
            case .success(let data):
                do {
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decode))
                }catch let error{
                    completionHandler(.failure(AppError(error:error.localizedDescription)))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
}
