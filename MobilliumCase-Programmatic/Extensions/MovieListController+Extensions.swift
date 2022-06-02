//
//  MovieListController+Extensions.swift
//  MobilliumCase-Programmatic
//
//  Created by Emir Alkal on 2.06.2022.
//

import UIKit

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = UITableViewCell()
        movieCell.backgroundColor = UIColor(named: Colors.backgroundColor.rawValue)
        let label = MobilliumLabel(title: movieModel.getMovieTitle(at: indexPath.row), fontSize: 17, fontWeight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        movieCell.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: movieCell.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: movieCell.centerYAnchor)
        ])
        
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentAlert(title: "Info", message: movieModel.getMovieTitle(at: indexPath.row))
    }

}
