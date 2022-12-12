//
//  ServiceHelper.swift
//  MoviesApi
//
//  Created by OMER on 7.12.2022.
//

import Foundation
import Alamofire

// MARK: HTTP Methods
public enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}

// MARK: Error Defaults
public enum Error: Swift.Error{
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}

// MARK: EndPoint
public enum ServiceEndPoint: String{
    case BASE_URL = "https://api.themoviedb.org/3/search/movie"
    case APP_TOKEN = "60b87c964abe45c9b6a0f56dc5df2e3f"
}

// MARK: Service Helper & Singleton
public class ServiceHelper{
    
    public static let shared = ServiceHelper()
    
    // MARK: Headers
    public let headers: HTTPHeaders = [
        "Content-Type": "application/json; charset=UTF-8"
    ]
}
