//
//  ServiceProtocol.swift
//  MoviesApi
//
//  Created by OMER on 7.12.2022.
//

import Foundation
import Alamofire

// MARK: Service Protocol
public protocol ServiceProtocol{
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, paramaters: [String: String], completion: @escaping((Results<T>) -> ()))
    func fetchMovies(paramaters: [String: String], completion: @escaping (Results<MovieResponse>) -> Void)
}
