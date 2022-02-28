//
//  VideoResponse.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import Foundation

struct VideoResponse: Codable{
    
    let id      :   Int?
    let list    :   [_Video]?
    
    struct _Video: Codable{
        let key     :   String?
        let name    :   String?
        let site    :   String?
        let type    :   String?
        
        enum CodingKeys: String, CodingKey {
            case key    =   "key"
            case name   =   "name"
            case site   =   "site"
            case type   =   "type"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id     =   "id"
        case list   =   "results"
    }
}
