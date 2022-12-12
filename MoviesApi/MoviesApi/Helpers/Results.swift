//
//  Results.swift
//  MoviesApi
//
//  Created by OMER on 7.12.2022.
//

import Foundation

// MARK: Results
public enum Results<Value>{
    case success(Value)
    case failure(Error)
}
