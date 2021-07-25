//
//  EventModel.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/22/21.
//

import Foundation

struct Event: Codable {
    var title: String
    var dateTimeLocal: Date
    var performers: [Performer]
    var venue: Venue
}

struct Performer: Codable {
    let image: String
    let images: Images
    let type: String
}

struct Venue: Codable {
    let city: String
    let state: String
}

struct Images: Codable {
    let largeImage: String
    let hugeImage: String
    let smallImage: String
    let mediumImage: String
}
