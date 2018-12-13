//
//  SeriesViewControllerTests.swift
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

class SeriesViewControllerTests: XCTestCase {
  // MARK: Subject under test
  
  var sut: SeriesViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    window = UIWindow()
    setupSeriesViewController()
  }
  
  override func tearDown() {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupSeriesViewController() {
    sut = (UIStoryboard(name: "SeriesViewController", bundle: nil).instantiateInitialViewController() as! SeriesViewController)
  }
  
  func loadView() {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class SeriesBusinessLogicSpy: SeriesBusinessLogic {
    var fetchSeriesCalled = false
    func fetchSeries(request: Series.Request) {
        fetchSeriesCalled = true
    }
  }
  
  // MARK: Tests
  
  func testShouldFetchSeriesWhenViewIsLoaded() {
    // Given
    let spy = SeriesBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.fetchSeriesCalled, "viewDidLoad() should ask the interactor to do something")
  }
  
  func testDisplaySeries() {
    // Given
    let viewModel = Series.ViewModel(displayedSeries: [Series.ViewModel.DisplayedSerie(title: "Serie Test", posterPath: "/test.png", releaseDate: Date(), overview: "Good serie test", identifier: 1), Series.ViewModel.DisplayedSerie(title: "Serie Test 2", posterPath: "/test1.png", releaseDate: Date(), overview: "Good serie test 2", identifier: 2)])
    
    // When
    loadView()
    sut.displaySeries(viewModel: viewModel)
    
    // Then
    XCTAssertTrue(sut.series?.displayedSeries.count == 2, "Wrong number of series.");
    XCTAssertEqual(sut.series?.displayedSeries.first?.title, "Serie Test")
  }
}