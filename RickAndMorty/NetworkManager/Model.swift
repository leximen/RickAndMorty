//
//  Model.swift
//  RickAndMorty
//
//  Created by MacLex on 06.06.2021.
//
struct RickAndMorty: Codable {
    let info: Info?
    let results: [Hero]?
}
struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
struct Hero: Codable {
   let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}
struct Origin: Codable {
    let name: String?
    let url: String?
}
struct Location: Codable {
    let name: String?
    let url: String?
}

struct RickAndMortyEpisodes: Codable {
    let info: Info?
    let results: [Episodes]?
}
struct Episodes: Codable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
}
