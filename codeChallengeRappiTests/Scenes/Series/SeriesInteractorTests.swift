//
//  SeriesInteractorTests.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 13/12/2018.
//  Copyright (c) 2018 rappi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import codeChallengeRappi
import XCTest

class MockSeriesWorker: SeriesWorkerProtocol {
    func fetchByCategoy(page: Int, category: Categories, completion: @escaping ([Serie]) -> Void, failure: @escaping (Error) -> Void) {
        let serie1 = Serie(); serie1.serieId = 1; serie1.name = "Test"
        let serie2 = Serie(); serie2.serieId = 2; serie2.name = "Test 2"
        completion([serie1, serie2])
    }
}

class SeriesInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: SeriesInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupSeriesInteractor()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupSeriesInteractor() {
    sut = SeriesInteractor()
    sut.worker = MockSeriesWorker()
  }
  
  // MARK: Test doubles
  
  class SeriesPresentationLogicSpy: SeriesPresentationLogic {
    
    var presentSeriesCalled = false
    
    func presentSeries(response: Series.Response) {
        presentSeriesCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSeries() {
    // Given
    let spy = SeriesPresentationLogicSpy()
    sut.presenter = spy
    let request = Series.Request(category: Categories.Popular, page: 1)
    
    // When
    sut.fetchSeries(request: request)
    
    // Then
    XCTAssertTrue(spy.presentSeriesCalled, "doSomething(request:) should ask the presenter to format the result")
  }
}
