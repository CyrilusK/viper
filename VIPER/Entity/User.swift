//
//  Entity.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

//model

struct User: Codable {
    let name: String
}

enum FetchError: Error {
    case failed
}
