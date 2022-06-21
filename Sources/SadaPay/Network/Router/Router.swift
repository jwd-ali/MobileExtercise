//
//  Router.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
struct ProductionServer {
    static var host = "github-trending-api.now.sh"
}
public protocol URLRequestConvertible {
    func urlRequest()  -> URLRequest?
}
enum Router<T>: URLRequestConvertible {
    
    case getTrendingRespostries(T)
    
    private var scheme: String {
        switch self {
        case .getTrendingRespostries:
            return "https"
        }
    }
    private var host: String {
        switch self {
        case .getTrendingRespostries:
            return ProductionServer.host
        }
    }
    private var path: String {
        switch self {
        case .getTrendingRespostries:
            return  "/repositories"
        }
    }
    private var method: String {
        switch self {
        case .getTrendingRespostries:
            return "GET"
        }
    }
    private var queryParameters: [URLQueryItem]? {
        switch self {
        case .getTrendingRespostries(let params):
            let request = params as! TrendingRespostriesRequest
            return [URLQueryItem(name: "language", value: String(request.language)),
                    URLQueryItem(name: "since", value: String(request.since))]
        }
    }
    
    
    
    func urlRequest() -> URLRequest? {
        var components = URLComponents()
        components.queryItems = queryParameters
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        
        guard let url = components.url else {
            assert(true,"url not formed")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method
        
        return urlRequest
    }
}
