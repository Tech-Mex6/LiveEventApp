//
//  ErrorMessage.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/22/21.
//

import Foundation

enum LEError: String, Error {
    case unableToComplete  = "Unable to complete your request, please check your internet connection."
    case invalidURL        = "The url is invalid, make sure you have the right url."
    case invalidResponse   = "Invalid response from the server. Please try again."
    case invalidData       = "The data received from the server is invalid, please try again."
    case unableToFavorite  = "An error occurred while adding this event to favorites. Please try again."
    case alreadyInFavorite = "This event has already been added to favorites."
}
