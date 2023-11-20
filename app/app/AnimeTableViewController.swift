import UIKit

final class AnimeTableViewController: UIViewController {
    
    private lazy var contentView: AnimeTableView = {
        let view = AnimeTableView()
        return view
    }()
    
    private let service = AnimeService()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchAnime { [weak self] animeArray in
            guard let self = self else { return }
            
            let animeDictionary = Dictionary(uniqueKeysWithValues: animeArray.map { ($0.title, $0) })
            
            DispatchQueue.main.async {
                self.contentView.configure(with: animeDictionary)
            }
        }
    }
}
