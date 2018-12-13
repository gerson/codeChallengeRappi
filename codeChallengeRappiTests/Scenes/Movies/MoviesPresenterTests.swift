//
//  MoviesPresenterTests.swift
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

class MoviesPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: MoviesPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupMoviesPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupMoviesPresenter()
  {
    sut = MoviesPresenter()
  }
  
  // MARK: Test doubles
  
  class MoviesDisplayLogicSpy: MoviesDisplayLogic {
    
    var displayMoviesCalled = false
    
    func displayMovies(viewModel: Movies.ViewModel) {
        displayMoviesCalled = true
    }
    
  }
  
  // MARK: Tests
  
  func testPresentMovies() {
    // Given
    let spy = MoviesDisplayLogicSpy()
    sut.viewController = spy
    let movie1 = Movie(); movie1.movieId = 1; movie1.title = "Test"
    let movie2 = Movie(); movie2.movieId = 2; movie2.title = "Test 2"
    let response = Movies.Response(movies: [movie1, movie2])
    
    // When
    sut.presentMovies(response: response)
    
    // Then
    XCTAssertTrue(spy.displayMoviesCalled, "presentMovies(response:) should ask the view controller to display the result")
  }
}