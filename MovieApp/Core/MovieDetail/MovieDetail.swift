//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

struct MovieDetail{
    var id                  :   Int?
    var title               :   String?
    var originalTitle       :   String?
    var poster              :   UIImage?
    var originalLanguage    :   String?
    var overview            :   String?
    var releaseDate         :   String?
    var genders             :   String?
    var companies           :   [Companies]?
    var popularity          :   Float?
}

struct Companies{
    var logo    :   UIImage?
    let name    :   String?
}
