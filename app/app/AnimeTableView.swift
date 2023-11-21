import UIKit
import Foundation

final class AnimeTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager as! any UITableViewDataSource
        return tableView
    }()
    
    private lazy var tableManager = AnimeTableManager()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [String: Anime]) {
        tableManager.animeData = viewModel
        tableView.reloadData()
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
