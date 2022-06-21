//
//  TrendingRespostriesViewModelTests.swift
//  MobileExerciseTests
//
//  Created by Jawad Ali on 25/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
import XCTest
@testable import MobileExercise

class TrendingRespostriesViewModelTests: XCTestCase {
    
    var sut: TrendingRespostriesViewModelType!
    var repository: TrendRepositoryType!
    
    override func setUpWithError() throws {
        repository = TrendRepositoryMocked()
        sut = TrendingRespostriesViewModel(respostry: repository)
    }
    
    override func tearDownWithError() throws {
         repository = nil
         sut = nil
     }
    
    func test_view_model_creation_success() {
        sut.requestTrendingData()
        XCTAssertEqual(sut.numberOfRows(),sut.cellViewModels?.count)
    }
    
    func test_title_viewmodels() {
        let correctValues = "Trending"
        XCTAssertEqual(correctValues, sut.getTitle())
    }
    
    func test_table_view_cell_view_model_at_index() {
        sut.requestTrendingData()
        let type = sut.tableViewCellViewModel(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(type)
    }
    
    func test_number_of_rows_with_table_view() {
        sut.requestTrendingData()
        let controller = TrendingRespostriesViewController(viewModel: sut)
        _ = controller.view
        XCTAssertEqual(sut.numberOfRows(), controller.tableView.numberOfRows(inSection: 0))
    }
    
    
}
