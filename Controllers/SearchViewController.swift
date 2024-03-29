//
//  SearchViewController.swift
//  Linchess
//
//  Created by Егор on 06/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

// TODO: ------------
// Logirovanie v fail
// Pdf generaciya
// unit tests
// dataBase: Core Data
// + Napisat' kursach


import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpNavigationBar()
    }
    
    private let viewModel = SearchViewModel()
    
    private let searchController = UISearchController(searchResultsController: nil)

    private func setUpNavigationBar() {
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "GM, WGM, IM, WIM, FM, WFM, NM, WNM, CM, WCM"
        self.definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true  
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserDetailedViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.userName = viewModel.player(for: indexPath.row)
        }
    }
    
    
}


    // MARK: - Extensions

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
            as? PlayerTableViewCell else { return UITableViewCell() }
        
        cell.viewModel = viewModel.cellViewModel(for: indexPath.row)
        
        return cell
    }
    
    
}


extension SearchViewController: UISearchBarDelegate
{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        if var text = searchBar.text {
            text = text.uppercased()
            viewModel.getTitledUsers(for: text) { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        self.searchController.isActive = false
    }
    
}




