//
//  ViewController.swift
//  DemoProject
//
//  Created by Govind Sen on 28/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.dataSource = self
        self.configuration()

    }
}

extension ViewController {
    
    func configuration() {
        tableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesTableViewCell")
        self.initViewModel()
        self.observeEvent()
    }
    
    func initViewModel() {
        self.viewModel.fetchMovies()
    }
    
    func observeEvent() {
        self.viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                print("Product loading...")
            case .stopLoading:
                print("Stop loading...")
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(self.viewModel.movies)
            case .error(let error):
                print(error as Any)
            }
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell") as? MoviesTableViewCell else { return UITableViewCell() }
        let movies = viewModel.movies[indexPath.row]
        cell.movie = movies
        return cell
    }
}




