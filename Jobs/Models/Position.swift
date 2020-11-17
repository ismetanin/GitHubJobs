//
//  Position.swift
//  Jobs
//
//  Created by i.smetanin on 25.10.2020.
//

import Foundation

struct Position: Decodable, Identifiable {
    let id: String
    let type: String
    let url: String
    let company: String
    let location: String
    let description: String
    let title: String
}
