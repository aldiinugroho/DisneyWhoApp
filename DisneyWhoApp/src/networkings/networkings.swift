//
//  networking.swift
//  DisneyWhoApp
//
//  Created by aldinugroho on 12/12/22.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

struct responsedata: Decodable {
    let data: [data]
}

struct data: Decodable {
    let films: Array<String>
    let shortFilms: Array<String>
    let tvShows: Array<String>
    let videoGames: Array<String>
    let parkAttractions: Array<String>
    let allies: Array<String>
    let enemies: Array<String>
    let _id: Int
    let name: String
    let imageUrl: String
    let url: String
}

class Networkings {
    func fetchListCharacters(completion: @escaping (Result<responsedata,NetworkError>) -> Void) {
        let urlMain = URL(string: "https://api.disneyapi.dev/characters")!
        let session = URLSession.shared
        session.dataTask(with: urlMain) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    // print(String(data: data, encoding: .utf8) as AnyObject)
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(responsedata.self, from: data)
                    completion(.success(result))
                } catch (let e) {
                    print(e)
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
