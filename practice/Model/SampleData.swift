//
//  SampleData.swift
//  practice
//
//  Created by GD Seo on 2018. 3. 26..
//  Copyright © 2018년 GD Seo. All rights reserved.
//

import Foundation

struct Sample {
    let title: String
    let description: String
    let image: String
}

struct SampleData {
    let samples = [
        Sample(title: "Photo Object Detection", description: "description1", image: "ic_photo"),
        Sample(title: "Real Time Object Detection", description: "description2", image: "ic_camera"),
        Sample(title: "Face Analysis", description: "description3", image: "ic_emoticon")
    ]
}
