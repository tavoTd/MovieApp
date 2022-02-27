//
//  MoviesListResponse.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import Foundation

struct MoviesListResponse: Codable{
    
    let page            :   Int?
    let totalPages      :   Int?
    let totalResults    :   Int?
    let list            :   [_Movie]?
    
    struct _Movie: Codable{
        let id                  :   Int?
        let title               :   String?
        let originalTitle       :   String?
        let poster              :   String?
        let originalLanguage    :   String?
        let overview            :   String?
        let releaseDate         :   String?
        let genders             :   [Int]?
        let popularity          :   Float?
        
        enum CodingKeys: String, CodingKey {
            case id                 =   "id"
            case poster             =   "poster_path"
            case overview           =   "overview"
            case releaseDate        =   "release_date"
            case genders            =   "genre_ids"
            case title              =   "title"
            case originalLanguage   =   "original_language"
            case originalTitle      =   "original_title"
            case popularity         =   "vote_average"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case page           =   "page"
        case totalPages     =   "total_pages"
        case totalResults   =   "total_results"
        case list           =   "results"
    }
}
