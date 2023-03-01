//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

// Structs
public struct Message: Convertable, Hashable {
    public var role: Role
    public var content: String
    
    public init(role: Role, content: String) {
        self.role = role
        self.content = content
    }
}
