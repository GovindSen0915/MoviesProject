//
//  MoviesModel.swift
//  DemoProject
//
//  Created by Govind Sen on 28/10/23.
//

import Foundation

//struct MoviesModel: Decodable {
//    let title: String?
//    let year: String?
//    let imdbID: String?
//    let type: String?
//    let poster: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case year = "Year"
//        case poster = "Poster"
//    }
//}


//struct MoviesModel: Decodable {
//    let title: String?
//    let year: String?
//    let imdbID: String?
//    let type: String?
//    let poster: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case year = "Year"
//        case imdbID = "imdbID"
//        case type = "Type"
//        case poster = "Poster"
//    }
//}

struct MoviesModel: Decodable {
    let Search: [Movie]
    let totalResults: String
    let Response: String

    struct Movie: Decodable {
        let title: String
        let year: String
        let imdbID: String
        let type: String
        let poster: String
    }
    
    enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID = "imdbID"
            case type = "Type"
            case poster = "Poster"
        }
}

