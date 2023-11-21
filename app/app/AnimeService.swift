import Foundation

protocol AnimeServicing {
    func fetchAnime(completionHandler: @escaping ((([String: Anime]) -> Void)))
}

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
}
extension AnimeService: AnimeServicing {
    func fetchAnime(completionHandler: @escaping ((([String: Anime]) -> Void))) {
        let anime_url: URL = URL(string: "https://api.jikan.moe/v4/random/anime")!
        URLSession.shared.dataTask(with: anime_url) { data, response, error in
            guard
                let data = data,
                let response,
                error == nil
            else {
                return
            }
            do {
                let animeData = try! self.decoder.decode([String: Anime].self, from: data)
                completionHandler(animeData)
                print(animeData)
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}

