//
//  AnimeTableManager.swift
//  app
//
//  Created by Владимир Мацнев on 20.11.2023.
//

import Foundation
import UIKit

final class AnimeTableManager: NSObject {
    var tableData: [String: Anime] = [:]
}

extension AnimeTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let anime = Array(tableData.values)[indexPath.row]
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "\(anime.title) / \(anime.titleJapanese)\nMAL ID: \(anime.malId) / Genre: \(anime.genres?.first?.name ?? "N/A")"
        configuration.secondaryText = anime.synopsis
        cell.contentConfiguration = configuration
        return cell
    }
}
