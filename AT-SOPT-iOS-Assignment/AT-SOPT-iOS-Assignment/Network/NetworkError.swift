//
//  NetworkError.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import Foundation

enum NetworkError: Int, Error {
    case requestEncodingError
    case responseDecodingError
    case responseError
    case unknownError
    case internalServerError = 500
    case notFoundError = 404
}
