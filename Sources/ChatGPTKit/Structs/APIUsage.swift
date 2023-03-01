//
//  File.swift
//  
//
//  Created by Sai Kambampati on 3/1/23.
//

import Foundation

public struct APIUsage: Codable {
    var prompt_tokens: Int
    var completion_tokens: Int
    var total_tokens: Int
}
