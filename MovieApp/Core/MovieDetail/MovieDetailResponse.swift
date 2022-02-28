//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

struct MovieDetailResponse: Codable{
    
    let id                  :   Int?
    let title               :   String?
    let originalTitle       :   String?
    let poster              :   String?
    let originalLanguage    :   String?
    let overview            :   String?
    let releaseDate         :   String?
    let genders             :   [_Genders]?
    let companies           :   [_Companies]?
    let popularity          :   Float?
    
    struct _Genders: Codable{
        let id      :   Int?
        let name    :   String?
        
        enum CodingKeys: String, CodingKey {
            case id     =   "id"
            case name   =   "name"
        }
    }
    
    struct _Companies: Codable{
        let logo    :   String?
        let name    :   String?
        
        enum CodingKeys: String, CodingKey {
            case logo     =   "logo_path"
            case name     =   "name"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id                 =   "id"
        case poster             =   "poster_path"
        case overview           =   "overview"
        case releaseDate        =   "release_date"
        case genders            =   "genres"
        case title              =   "title"
        case originalLanguage   =   "original_language"
        case originalTitle      =   "original_title"
        case popularity         =   "vote_average"
        case companies          =   "production_companies"
    }
}
