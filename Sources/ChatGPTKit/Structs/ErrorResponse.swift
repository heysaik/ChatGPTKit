//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/5/23.
//

import Foundation

public struct ErrorResponse: Decodable {
    public var error: APIError
    
    public init(error: APIError) {
        self.error = error
    }
}
