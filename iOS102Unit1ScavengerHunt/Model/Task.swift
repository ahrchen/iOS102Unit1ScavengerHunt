//
//  Task.swift
//  lab-task-squirrel
//
//  Created by Charlie Hieger on 11/15/22.
//

import UIKit
import CoreLocation

class Task {
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool {
        image != nil
    }

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    func set(_ image: UIImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = location
    }
}

extension Task {
    static var mockedTasks: [Task] {
        return [
            Task(title: "Your favorite Farmers Market 💐",
                 description: "Where is your favorite farmers market? Is it nearby or far away?"),
            Task(title: "Your favorite part of town 🏘️",
                 description: "Where is your favorite part of town? Is it your neighborhood?"),
            Task(title: "Your favorite park in the city 🏞️",
                 description: "What is your favorite park in the city? Is it Golden Gate Park?")
        ]
    }
}
