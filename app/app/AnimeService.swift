import Foundation

protocol AnimeServicing {
    func fetchAnime(completionHandler: @escaping (([String: Anime]) -> Void))
}

final class AnimeService {
    let url: URL = URL(string: "https://api.jikan.moe/v4/random/anime")!
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    var session: URLSession?

    init() {
        configureSession()
    }

    private func configureSession() {
        let sessionConfiguration = URLSessionConfiguration.default
        session = URLSession(configuration: sessionConfiguration)
    }
}

extension AnimeService: AnimeServicing {
    func fetchAnime(completionHandler: @escaping ([String: Anime]) -> Void) {
        let anime_url: URL = URL(string: "https://api.jikan.moe/v4/random/anime")!
        guard let session = session else { return }
        session.dataTask(with: anime_url) { data, response, error in
            guard
                let data = data,
                let response,
                error == nil
            else {
                return
            }
            let animeData = try! self.decoder.decode([String: Anime].self, from: data)
            if let anime = animeData.values.first, let genreData = anime.genres, genreData.contains(where: { $0.name == "Hentai" || $0.name == "Ecchi" })  {
                print("Content filtered.")
                self.restartSession(completionHandler: completionHandler)
                return
            }

            completionHandler(animeData)
            print(animeData)
        }.resume()
    }

    private func restartSession(completionHandler: @escaping ([String: Anime]) -> Void) {
        session?.finishTasksAndInvalidate()
        configureSession()
        fetchAnime(completionHandler: completionHandler)
    }
}
