//
//  AppError.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
public struct AppError: Codable,Error {
    let error : String
    let isNetworkError: Bool
    
    static func generalError() -> AppError{
        return AppError(error: "some thing went wrong")
    }
    
    init(error: String) {
        self.error = error
        self.isNetworkError = false
    }
    
    init(error: String, isNetworkError: Bool) {
        self.error = error
        self.isNetworkError = isNetworkError
    }
    
}

extension AppError {
    private enum CodingKeys: String, CodingKey {
        case error = "Error"
        case isNetworkError = "Network"
    }
}
