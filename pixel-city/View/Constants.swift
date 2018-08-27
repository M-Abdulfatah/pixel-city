//
//  Constants.swift
//  pixel-city
//
//  Created by Mahmoud Mohammed on 8/11/18.
//  Copyright © 2018 Mahmoud Mohammed. All rights reserved.
//

import Foundation
// This Key Changes Based On User Account On Flickr
private let apiKey = "903fb47b981b71bcaa600362da5fe8a2"

func flickrUrl(withAnnotation annotation: DroppablePin, andNumberOfPhotos number: Int) -> String {
    return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=1&radius_units=mi&per_page=\(number)&format=json&nojsoncallback=1"
}
