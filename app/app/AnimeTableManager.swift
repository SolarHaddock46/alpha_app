import Foundation
import UIKit

final class AnimeTableManager: NSObject {
    var animeData: [String: Anime] = [:]
}

extension AnimeTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeData.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let anime = Array(animeData.values)[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "\(anime.title) / \(anime.titleJapanese)\nMAL ID: \(anime.malId) / Genre: \(anime.genres?.first?.name ?? "N/A")"
        configuration.secondaryText = anime.synopsis
        cell.contentConfiguration = configuration
        return cell
    }
}
