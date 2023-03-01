//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

public struct Response: Identifiable, Hashable, Equatable, Codable {
    public var id: String
    public var object: String
    public var created: Int
    public var choices: [ResponseChoice]
    public var usage: APIUsage
    
    public static func == (lhs: Response, rhs: Response) -> Bool {
        return lhs.id == rhs.id
    }
    
}
