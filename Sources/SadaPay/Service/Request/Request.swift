//
//  Request.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation

struct TrendingRespostriesRequest: Codable {
    let since : String
    let language: String
}
