//
//  ViewController.swift
//  app
//
//  Created by Владимир Мацнев on 06.10.2023.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeData.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let anime = Array(animeData.values)[indexPath.row]
//        let genreData = Array(anime.genres)
//        print(genreData)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "\(anime.title) / \(anime.titleJapanese)\nMAL ID: \(anime.malId) / Genre: \(anime.genres?.first?.name ?? "N/A")"
        configuration.secondaryText = anime.synopsis
        
//        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40)]
        
        cell.contentConfiguration = configuration
        
        return cell
    }

    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        spinner.hidesWhenStopped = true
        return spinner
    }()

private var animeData: [String: Anime] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(tableView)
        view.addSubview(spinner)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        spinner.translatesAutoresizingMaskIntoConstraints = false

        // Add constraints for tableView
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        // Add constraints for spinner
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // Show spinner while loading data
        spinner.startAnimating()

        let anime_url: URL = URL(string: "https://api.jikan.moe/v4/random/anime")!
        
        URLSession.shared.dataTask(with: anime_url) { data, response, error in
            defer {
                // Stop spinner on main thread after data task completion
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                }
            }
            
            guard
                let data = data,
                let response,
                error == nil
            else {
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                self.animeData = try decoder.decode([String: Anime].self, from: data)
                print(self.animeData)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
