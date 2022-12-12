//
//  Decoders.swift
//  MoviesApi
//
//  Created by OMER on 7.12.2022.
//

import Foundation

// MARK: Decoders
public enum Decoders{
    static let dateCodable: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
