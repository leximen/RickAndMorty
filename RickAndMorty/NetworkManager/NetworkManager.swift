//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by MacLex on 14.06.2021.

import Alamofire
import UIKit
// MARK: парсим первую страницу
class NetworkManager {
    func fetchPage(completion: @escaping (RickAndMorty?) ->()) {
        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: RickAndMorty.self) { result in
            completion(result.value)
        }
    }

    static func fetchImage(url: String, completion: @escaping (UIImage?) ->()) {
        AF.request(url).response { result in
            completion(UIImage(data: result.data ?? Data()))
        }
    }

    static func fetchEpisodes(episodes: String, completion: @escaping ([Episodes]?) -> ()) {
        AF.request("https://rickandmortyapi.com/api/episode/\(episodes)").responseDecodable(of: [Episodes].self) { result in
            completion(result.value)
        }
    }

    static func fetchHero(index: Int, completion: @escaping (Hero?) -> ()) {
        AF.request("https://rickandmortyapi.com/api/character/\(index)").responseDecodable(of: Hero.self) { result in
            completion(result.value)
        }
    }
    
}


