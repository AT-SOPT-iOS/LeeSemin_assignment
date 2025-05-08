//
//  GetBoxOfficeMovieService.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import Foundation

final class GetBoxOfficeMovieService {
    
    static let shared = GetBoxOfficeMovieService()
    private init() {}
    
    private func makeRequest() -> URLRequest? {
        var urlString = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        
        let targetDt = "20240304"
        
        urlString += "?key=\(Config.key)&targetDt=\(targetDt)"
        
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func fetchMovieList() async throws -> [MovieInfo] {
        guard let request = makeRequest() else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(BoxOfficeMovieResponseWrapper.self, from: data)
            let movieInfos = decoded.boxOfficeResult.dailyBoxOfficeList.map { item in
                MovieInfo(
                    rank: item.rank,
                    name: item.movieNm,
                    openDate: item.openDt,
                    totalAudience: item.audiAcc
                )
            }
            return movieInfos
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
}

struct MovieInfo {
    let rank: String
    let name: String
    let openDate: String
    let totalAudience: String
}
