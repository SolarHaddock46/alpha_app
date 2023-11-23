import Foundation
import UIKit

protocol AnimeTableManagerDelegate {
    func didSelectRow(_ animeModel: [String: Anime])
}


final class AnimeTableManager: NSObject {
    var delegate: AnimeTableManagerDelegate?
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
        configuration.text = "\(anime.title)"
        configuration.secondaryText = "Genre: \(anime.genres?.first?.name ?? "N/A") / Episodes: \(anime.episodes ?? 0)"
        cell.contentConfiguration = configuration
        return cell
    }
}

extension AnimeTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectRow(Array(arrayLiteral: animeData)[indexPath.row])
    }
}
