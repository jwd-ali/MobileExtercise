//
//  TrendingRespostriesViewModel.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
protocol TrendingRespostriesViewModelType {
    func numberOfRows()-> Int
    func getTitle() -> String
    func prefetch()
    func requestTrendingData()
    func tableViewCellViewModel(for indexPath: IndexPath) -> TrendingRespostriesTableCellViewModelType?
    var reloadTableViewClosure: (()->())? { get set}
    var showNetworkErrorClosure: (()->())? { get set}
    var cellViewModels : [TrendingRespostriesTableCellViewModelType]? { get }
}

class TrendingRespostriesViewModel: TrendingRespostriesViewModelType {
   
    
    //MARK:- Propeerties
    private var respostry: TrendRepositoryType
    private var respostries: TrendingRepositories?
    private(set) lazy var cellViewModels : [TrendingRespostriesTableCellViewModelType]? = [TrendingRespostriesTableCellViewModelType]()
    var reloadTableViewClosure: (()->())?
    var showNetworkErrorClosure: (()->())?
    
    //MARK:- Initializer
    init(respostry: TrendRepositoryType) {
        self.respostry = respostry
    }
    
    func requestTrendingData() {
        respostry.getDailyTrendingRespositories { [weak self] (result)  in
            guard let self = self else {return}
            
            switch result {
            case .success(let trendingRespostries):
                self.respostries = trendingRespostries
                self.processViewModels()
            case .failure:
                 self.showNetworkErrorClosure?() 
            }
            
        }
    }
    
    private func processViewModels() {
        cellViewModels = self.respostries?.compactMap { TrendingRespostriesTableCellViewModel(with: $0) }
        reloadTableViewClosure?()
    }
    
    func numberOfRows() -> Int {
        cellViewModels?.count ??  0
    }
    
    func getTitle() -> String {
        "Trending"
    }
    
    func prefetch() {
        let urls : [URL] = respostries?.compactMap { URL(string: $0.avatar) } ?? []
          AppAsyncImage().prefetchImages(for: urls)
      }
    
    func tableViewCellViewModel(for indexPath: IndexPath) -> TrendingRespostriesTableCellViewModelType? {
        return cellViewModels?[indexPath.row]
    }
}
