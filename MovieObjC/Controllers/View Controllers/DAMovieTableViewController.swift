//
//  DAMovieTableViewController.swift
//  MovieObjC
//
//  Created by Darin Marcus Armstrong on 7/5/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class DAMovieTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movieItems: [DAMovie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 100

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? DAMovieTableViewCell else {return UITableViewCell()}
        
        let movieItem = movieItems[indexPath.row]
        cell.updateCell(movie: movieItem)
        
        return cell
    }
}

extension DAMovieTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view .endEditing(true)
        guard let searchTerm = searchBar.text, searchTerm != "" else {return}
        
        DAMovieController.fetchMovie(forSearchTerm: searchTerm) { (moviesFromCompletion) in
            if let unwrappedMovie = moviesFromCompletion {
                self.movieItems = unwrappedMovie
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
