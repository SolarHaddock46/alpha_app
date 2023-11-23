import Foundation

final class AnimeTableViewControllerFactory {
    func build() -> AnimeTableViewController {
        let service = AnimeService()
        let viewController = AnimeTableViewController(service: service)
        return viewController
    }
}
