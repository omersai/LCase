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
public struct ServiceEndPoint{
    
    // MARK: Api Token
    static var baseUrl: String {
      get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "MeroService-Info", ofType: "plist") else {
          fatalError("Couldn't find file")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "BASE_URL") as? String else {
          fatalError("Couldn't find url 'BASE_URL'")
        }
          
        return value
      }
    }
    
    // MARK: Api Token
    static var apiKey: String {
      get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "MeroService-Info", ofType: "plist") else {
          fatalError("Couldn't find file")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY'")
        }
          
        return value
      }
    }
    
    static let BASE_URL = baseUrl
    static let APP_TOKEN = apiKey
}

// MARK: Service Helper & Singleton
public class ServiceHelper{
    
    public static let shared = ServiceHelper()
    
    
    
    
    // MARK: Headers
    public let headers: HTTPHeaders = [
        "Content-Type": "application/json; charset=UTF-8"
    ]
}

