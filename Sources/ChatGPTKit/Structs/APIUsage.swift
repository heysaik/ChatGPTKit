//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

public struct APIUsage: Codable, Hashable {
    public var prompt_tokens: Int
    public var completion_tokens: Int
    public var total_tokens: Int
}
