//
//  BoxOfficeMovieViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import UIKit
import SnapKit

class BoxOfficeMovieViewController: UIViewController {
    
    private var movieList: [String] = []
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setDelegate()
        fetchMovies()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        
        tableView.do{
            $0.register(MovieCell.self,
                        forCellReuseIdentifier: MovieCell.identifier)
            $0.rowHeight = 72
            $0.backgroundColor = .black
        }
    }
    
    private func setUI() {
        view.addSubview(tableView)
    }
    
    private func setLayout(){
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        tableView.dataSource = self
    }
    
    private func fetchMovies() {
        Task {
            do {
                let movies = try await GetMovieService.shared.fetchMovieList()
                self.movieList = movies
                self.tableView.reloadData()
            } catch {
                print("영화 불러오기 실패:", error)
            }
        }
    }
}

extension BoxOfficeMovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieCell.identifier,
            for: indexPath
        ) as? MovieCell else { return UITableViewCell() }
        cell.configure(movieName: movieList[indexPath.row])
        return cell
    }
}

#Preview {
    MainViewController()
}
