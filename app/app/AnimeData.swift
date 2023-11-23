import Foundation

struct Anime: Decodable {
    let malId: Int
    let url: URL
    let images: Images?
    let titles: [Title]?
    let title: String
    let titleJapanese: String
    let episodes: Int?
    let synopsis: String?
    let year: Int?
    let genres: [Genre]?
    let explicitGenres: [String]?
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


struct Title: Decodable {
    let type: String?
    let title: String?
}

struct Genre: Decodable {
    let malId: Int?
    let type: String?
    let name: String?
    let url: URL?
}

    
    
