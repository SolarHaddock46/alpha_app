//
//  ViewController.swift
//  app
//
//  Created by Владимир Мацнев on 06.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        let anime_url: URL = URL(string: "https://api.jikan.moe/v4/anime/5680")!
        let episodes_url: URL = URL(string: "https://api.jikan.moe/v4/anime/5680/episodes")!
        
        URLSession.shared.dataTask(with: anime_url, completionHandler: { data, response, error in
                guard
                    let data = data,
                    let response,
                    error == nil
            else {
                    return
                }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let anime_model = try! decoder.decode(AnimeData.self, from: data)
            print(anime_model)
            print("------------------------------------------------------------------------------------")
        }).resume()
        
        
        URLSession.shared.dataTask(with: episodes_url, completionHandler: { data, response, error in
                guard
                    let data = data,
                    let response,
                    error == nil
            else {
                    return
                }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let episodes_model = try! decoder.decode(EpisodesData.self, from: data)
            print(episodes_model)
        }).resume()
        
    }


}

struct AnimeData: Decodable {
    let data: Anime

    struct Anime: Decodable {
        let malId: Int?
        let url: URL?
        let images: Images?
        let trailer: Trailer?
        let approved: Bool?
        let titles: [Title]?
        let title: String?
        let titleEnglish: String?
        let titleJapanese: String?
        let titleSynonyms: [String]?
        let type: String?
        let source: String?
        let episodes: Int?
        let status: String?
        let airing: Bool?
        let aired: Aired?
        let duration: String?
        let rating: String?
        let score: Double?
        let scoredBy: Int?
        let rank: Int?
        let popularity: Int?
        let members: Int?
        let favorites: Int?
        let synopsis: String?
        let background: String?
        let season: String?
        let year: Int?
        let broadcast: Broadcast?
        let producers: [Producer]?
        let licensors: [Licensor]?
        let studios: [Studio]?
        let genres: [Genre]?
        let explicitGenres: [String]?
        let themes: [Theme]?
        let demographics: [Demographic]?
    }

    struct Images: Decodable {
        let jpg: ImageType?
        let webp: ImageType?
    }

    struct ImageType: Decodable {
        let imageUrl: URL?
        let smallImageUrl: URL?
        let largeImageUrl: URL?
    }

    struct Trailer: Decodable {
        let youtubeId: String?
        let url: URL?
        let embedUrl: URL?
        let images: TrailerImages?

        struct TrailerImages: Decodable {
            let imageUrl: URL?
            let smallImageUrl: URL?
            let mediumImageUrl: URL?
            let largeImageUrl: URL?
            let maximumImageUrl: URL?
        }
    }

    struct Title: Decodable {
        let type: String?
        let title: String?
    }

    struct Aired: Decodable {
        let from: String?
        let to: String?
        let prop: AiredProp?
        let string: String?

        struct AiredProp: Decodable {
            let from: DateComponents?
            let to: DateComponents?
        }
    }

    struct Broadcast: Decodable {
        let day: String?
        let time: String?
        let timezone: String?
        let string: String?
    }

    struct Producer: Decodable {
        let malId: Int?
        let type: String?
        let name: String?
        let url: URL?
    }

    struct Licensor: Decodable {
        let malId: Int?
        let type: String?
        let name: String?
        let url: URL?
    }

    struct Studio: Decodable {
        let malId: Int?
        let type: String?
        let name: String?
        let url: URL?
    }

    struct Genre: Decodable {
        let malId: Int?
        let type: String?
        let name: String?
        let url: URL?
    }

    struct Theme: Decodable {
        let malId: Int?
        let type: String?
        let name: String?
        let url: URL?
    }

    struct Demographic: Decodable {
        let malId: Int?
        let type: String?
        let name: String?
        let url: URL?
    }
}

struct EpisodesData: Decodable {
//    let pagination: Pagination
    let data: [Episode]

//    struct Pagination: Decodable {
//        let last_visible_page: Int?
//        let has_next_page: Bool?
//    }

    struct Episode: Decodable {
        let mal_id: Int?
        let url: String?
        let title: String?
        let title_japanese: String?
        let title_romanji: String?
        let aired: String?
        let score: Double?
        let filler: Bool?
        let recap: Bool?
        let forum_url: String?
    }
}

