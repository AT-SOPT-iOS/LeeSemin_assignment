//
//  BoxOfficeMovieViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import UIKit
import SnapKit

class BoxOfficeMovieViewController: UIViewController {
    
    private var movieList: [MovieInfo] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "일별 박스오피스 10"
        label.textColor = .white
        label.font = .bold(size: 20)
        return label
    }()
    
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
            $0.register(BoxOfficeMovieCell.self,
                        forCellReuseIdentifier: BoxOfficeMovieCell.identifier)
            $0.rowHeight = 130
            $0.backgroundColor = .black
        }
    }
    
    private func setUI() {
        view.addSubviews(titleLabel, tableView)
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(16)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        tableView.dataSource = self
    }
    
    private func fetchMovies() {
        Task {
            do {
                let movies = try await GetBoxOfficeMovieService.shared.fetchMovieList()
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
            withIdentifier: BoxOfficeMovieCell.identifier,
            for: indexPath
        ) as? BoxOfficeMovieCell else { return UITableViewCell() }
        let movie = movieList[indexPath.row]
        cell.configure(
            rank: movie.rank,
            name: movie.name,
            openDate: movie.openDate,
            totalAudience: movie.totalAudience
        )
        
        return cell
    }
}

#Preview {
    MainViewController()
}
