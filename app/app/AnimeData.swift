import Foundation

struct Anime: Decodable {
    let malId: Int
    let url: URL
    let images: Images?
    let trailer: Trailer?
    let approved: Bool?
    let titles: [Title]?
    let title: String
    let titleEnglish: String?
    let titleJapanese: String
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
