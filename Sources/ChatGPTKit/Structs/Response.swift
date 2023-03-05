//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

public struct Response: Identifiable, Hashable, Codable {
    public var id: String
    public var object: String
    public var created: Int
    public var choices: [ResponseChoice]?
    public var usage: APIUsage
    
    public init(id: String, object: String, created: Int, choices: [ResponseChoice]?, usage: APIUsage) {
        self.id = id
        self.object = object
        self.created = created
        self.choices = choices
        self.usage = usage
    }
}

extension Response: Equatable {
    public static func == (lhs: Response, rhs: Response) -> Bool {
        return lhs.id == rhs.id
    }
}
