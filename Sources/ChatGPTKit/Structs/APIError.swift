//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/5/23.
//

import Foundation

public struct APIError: Error {
    public var code: Int?
    public var message: String
    public var type: String?
    public var error: Error?
    
    public init(code: Int? = nil, message: String, type: String? = nil, error: Error? = nil) {
        self.code = code
        self.message = message
        self.type = type
        self.error = error
    }
}

extension APIError: Equatable {
    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        return lhs.message == rhs.message
    }
}

extension APIError: Decodable {
    enum CodingKeys: CodingKey {
        case code, message, param, type
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(Int?.self, forKey: .code)
        message = try container.decode(String.self, forKey: .message)
        type = try container.decode(String?.self, forKey: .type)
    }
}

extension APIError: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(message)
    }
}
