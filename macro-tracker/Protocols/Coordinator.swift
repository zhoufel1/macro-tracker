//
//  Coordinator.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-08.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

enum EmptyChildrenError: Error {
    case noChildren
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
