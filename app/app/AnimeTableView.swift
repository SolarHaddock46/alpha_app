import UIKit
import Foundation

protocol AnimeTableViewDelegate {
    func didSelectRow(_ animeModel: [String: Anime])
}


final class AnimeTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
        return tableView
    }()
    
    private lazy var tableManager = AnimeTableManager()
    var delegate: AnimeTableViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews()
        makeConstraints()
        tableManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [String: Anime]) {
        tableManager.animeData = viewModel
        tableView.reloadData()
    }
    
}


extension AnimeTableView: AnimeTableManagerDelegate {
    func didSelectRow(_ animeModel: [String: Anime]) {
        delegate?.didSelectRow(animeModel)
    }
}

private extension AnimeTableView {
    func addSubviews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    func makeConstraints() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
