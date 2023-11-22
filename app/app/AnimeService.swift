//
//  AnimeService.swift
//  app
//
//  Created by Владимир Мацнев on 20.11.2023.
//

import Foundation

final class AnimeService {
    let url: URL = URL(string: "https://api.jikan.moe/v4/random/anime")!
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    let session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        return session
    }()
    
    
    func fetchAnime(completionHandler: @escaping ((([Anime]) -> Void))) {
        
        let anime_url: URL = URL(string: "https://api.jikan.moe/v4/random/anime")!
        
        
        URLSession.shared.dataTask(with: anime_url) { data, response, error in
//            defer {
//                // Stop spinner on main thread after data task completion
//                DispatchQueue.main.async {
//                    self.spinner.stopAnimating()
//                }
//            }
            
            guard
                let data = data,
                let response,
                error == nil
            else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let animeData = try decoder.decode([String: Anime].self, from: data)
                print(animeData)
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}

