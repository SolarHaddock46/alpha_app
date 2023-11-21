import UIKit
import Foundation

final class AnimeTableViewController: UIViewController {
    
    private lazy var contentView: AnimeTableView = {
        let view = AnimeTableView()
        return view
    }()
    
    private var service: AnimeServicing
//    func setService(service: BeerService) {
//        self.service = service
//    }
    init(service: AnimeServicing) {
        self.service = service
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            service.fetchAnime { [weak self] animeArray in
                guard let self = self else { return }
                
                let animeDictionary = Dictionary(uniqueKeysWithValues: animeArray.enumerated().map { (String($0.offset), $0.element) })
                
                DispatchQueue.main.async {
                    self.contentView.configure(with: animeDictionary)
                }
            }
        }
}
