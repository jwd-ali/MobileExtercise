//
//  TrendingRespostriesTableCellViewModelTests.swift
//  MobileExerciseTests
//
//  Created by Jawad Ali on 25/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import XCTest
@testable import MobileExercise
class TrendingRespostriesTableCellViewModelTests: XCTestCase {
    var sut: TrendingRespostriesTableCellViewModelType!
    
    override func setUpWithError() throws {
        sut = TrendingRespostriesTableCellViewModel(with: TrendingRepository.mocked[0])
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_auth_name_viewmodels() {
           let correctValues = "Jawad"
           XCTAssertEqual(correctValues, sut.getAuthorName())
       }
    func test_respostry_name_viewmodels() {
        let correctValues = "JTabBar"
        XCTAssertEqual(correctValues, sut.getRespostryName())
    }
}
