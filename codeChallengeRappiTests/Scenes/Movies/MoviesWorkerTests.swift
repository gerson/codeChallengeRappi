//
//  MoviesWorkerTests.swift
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

class MoviesWorkerTests: XCTestCase {
  // MARK: Subject under test
  
  var sut: MoviesWorker!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupMoviesWorker()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupMoviesWorker() {
    sut = MoviesWorker()
  }
  
  // MARK: Test doubles
  
  // MARK: Tests
  
  func testSomething() {
    // Given
    
    // When
    
    // Then
  }
}