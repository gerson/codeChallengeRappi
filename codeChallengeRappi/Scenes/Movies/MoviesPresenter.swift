//
//  MoviesPresenter.swift
//  codeChallengeRappi
//
//  Created by Gerson Villanueva on 09/12/2018.
//  Copyright (c) 2018 rappi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MoviesPresentationLogic {
  func presentMovies(response: Movies.Response)
}

class MoviesPresenter: MoviesPresentationLogic {
  weak var viewController: MoviesDisplayLogic?
  
  // MARK: Present movies
  
  func presentMovies(response: Movies.Response) {
    var movieModels = [Movies.ViewModel.DisplayedMovie]()
    for movie in response.movies {
        var movieModel = Movies.ViewModel.DisplayedMovie()
        movieModel.title = movie.title
        movieModel.overview = movie.overview
        movieModel.posterPath = movie.posterPath
        movieModel.identifier = movie.movieId
        movieModels.append(movieModel)
    }
    let viewModel = Movies.ViewModel(displayedMovies: movieModels)
    viewController?.displayMovies(viewModel: viewModel)
  }
}
