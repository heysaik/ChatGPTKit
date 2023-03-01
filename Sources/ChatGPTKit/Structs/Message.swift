//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

// Structs
public struct Message: Convertable, Hashable {
    var role: Role
    var content: String
}
