import UIKit
import Foundation

final class AnimeTableViewController: UIViewController {
    
    private lazy var contentView: AnimeTableView = {
        let view = AnimeTableView()
        return view
    }()
    
    private var service: AnimeServicing
    
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
        
        service.fetchAnime { animes in
            DispatchQueue.main.async {
                self.contentView.configure(with: animes)
            }
        }
    }
}
