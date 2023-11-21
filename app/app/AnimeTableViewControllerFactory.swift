//
//  AnimeTableViewControllerFactory.swift
//  app
//
//  Created by Владимир Мацнев on 20.11.2023.
//

import Foundation

final class AnimeTableViewControllerFactory {
    func build() -> AnimeTableViewController {
        let service = AnimeService()
        let viewController = AnimeTableViewController(service: service)
        return viewController
    }
}
