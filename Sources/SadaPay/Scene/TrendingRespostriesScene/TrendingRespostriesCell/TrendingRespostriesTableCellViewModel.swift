//
//  TrendingRespostriesTableCellViewModel.swift
//  MobileExercise
//
//  Created by Jawad Ali on 24/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
protocol TrendingRespostriesTableCellViewModelType {
    func getLanguage() -> String
    func getStars() -> String
    func getAuthorName() -> String
    func getRespostryName() -> String
    func getLanguageColor() -> String
    func getAvatarURL() -> URL?
    func getDescription() -> String
}

class TrendingRespostriesTableCellViewModel: TrendingRespostriesTableCellViewModelType {
    
    //MARK:- Properties
    
    private let respostry : SegrigatedRespostries
    
    init(with respostry:SegrigatedRespostries) {
        self.respostry = respostry
    }
    
    func getLanguage() -> String {
        respostry.language
    }
    
    func getStars() -> String {
        "⭐️ \(respostry.stars)"
    }
    
    func getAuthorName() -> String {
        respostry.author
    }
    
    func getRespostryName() -> String {
        respostry.name
    }
    
    func getLanguageColor() -> String {
        respostry.languageColor
    }
    
    func getAvatarURL() -> URL? {
        URL(string: respostry.avatar)
    }
    
    func getDescription() -> String {
        respostry.trendingRepositoryDescription
    }
    
}
