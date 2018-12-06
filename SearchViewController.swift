//
//  SearchViewController.swift
//  Linchess
//
//  Created by Егор on 06/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(1)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    
    private let searchController = UISearchController(searchResultsController: nil)

    private func setUpNavigationBar() {
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true  
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
