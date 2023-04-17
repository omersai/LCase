//
//  Services.swift
//  MoviesApi
//
//  Created by OMER on 7.12.2022.
//

import Foundation
import Alamofire

// MARK: Service Manager
public class ServiceManager: ServiceProtocol{
    
    public static let shared = ServiceManager()
    public init(){}
    
    // MARK: Api Request
    public func request<T>(type: T.Type, url: String, method: HTTPMethod, paramaters: [String: String], completion: @escaping ((Results<T>) -> ())) where T : Decodable, T : Encodable {
        AF.request(url, method: method, parameters: paramaters, headers: ServiceHelper.shared.headers).responseData { (response) in           
            switch response.result{
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
    
    // MARK: Movies
    public func fetchMovies(paramaters: [String: String], completion: @escaping (Results<MovieResponse>) -> Void) {
        let movieURL = "\(ServiceEndPoint.BASE_URL)?api_key=\(ServiceEndPoint.APP_TOKEN)"
        ServiceManager.shared.request(type: MovieResponse.self, url: movieURL, method: .get, paramaters: paramaters) { response in
            switch response{
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
