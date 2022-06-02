//
//  MovieModel.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import Foundation

struct MovieModel {
    private var movies = [Movie]()
    
    init(movies: [Movie]) {
        for movie in movies {
            self.movies.append(movie)
        }
    }
    
    func getMovieTitle(at index: Int) -> String {
        return movies[index].title
    }
    
    func count() -> Int {
        return movies.count
    }
}

struct Movie {
    var title: String
}
