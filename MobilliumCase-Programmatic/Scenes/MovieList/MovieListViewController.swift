//
//  MovieListViewController.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

class MovieListViewController: UIViewController {

    let tableView = UITableView()
    let movieModel = MovieModel(movies: [Movie(title: "A Space Odyssey"),
                                         Movie(title: "The Godfather"),
                                         Movie(title: "Citizen Kane"),
                                         Movie(title: "Singin' in the Rain"),
                                         Movie(title: "Pulp Fiction"),
                                         Movie(title: "Toy Story"),
                                         Movie(title: "Taxi Driver"),
                                         Movie(title: "Shutter Island"),
                                         Movie(title: "The Dark Knight"),
                                         Movie(title: "Steve Jobs")])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.backgroundColor = UIColor(named: Colors.backgroundColor.rawValue)
        configureTableView()
    }
    
    func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: Colors.backgroundColor.rawValue)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
