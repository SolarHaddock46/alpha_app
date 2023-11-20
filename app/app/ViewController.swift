//
//  ViewController.swift
//  app
//
//  Created by Владимир Мацнев on 06.10.2023.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .cyan
        tableView.dataSource = self
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(tableView)
//        view.addSubview(spinner)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        spinner.translatesAutoresizingMaskIntoConstraints = false

        // Add constraints for tableView
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        // Add constraints for spinner
//        NSLayoutConstraint.activate([
//            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Show spinner while loading data
//        spinner.startAnimating()

    }
}
