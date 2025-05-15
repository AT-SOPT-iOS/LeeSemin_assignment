//
//  BoxOfficeMovieViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import UIKit

import SnapKit
import Then

class BoxOfficeMovieViewController: UIViewController {
    
    private var movieList: [MovieInfo] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "일별 박스오피스 10"
        label.textColor = .white
        label.font = .bold(size: 20)
        return label
    }()
    
    private let dateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setDelegate()
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
        view.addSubviews(titleLabel, tableView, dateTextField, searchButton)
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(16)
        }
        
        dateTextField.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-8)
            $0.width.equalTo(130)
            $0.height.equalTo(35)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(dateTextField)
            $0.trailing.equalToSuperview().offset(-8)
            $0.width.equalTo(50)
            $0.height.equalTo(35)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func setDelegate() {
        tableView.dataSource = self
    }
    
    private func fetchMovies(targetDt: String) {
        Task {
            do {
                let movies = try await GetBoxOfficeMovieService.shared.fetchMovieList(targetDt: targetDt)
                self.movieList = movies
                self.tableView.reloadData()
            } catch {
                print("영화 불러오기 실패: ", error)
            }
        }
    }
    
    @objc private func searchButtonTapped() {
        guard let dateText = dateTextField.text, dateText.count == 8 else {
            print("잘못된 날짜 형식")
            return
        }
        
        fetchMovies(targetDt: dateText)
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
