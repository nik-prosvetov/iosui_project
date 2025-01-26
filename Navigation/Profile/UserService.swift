//
//  UserService.swift
//  Navigation
//
//  Created by n.prosvetov on 22.01.2025.
//

import UIKit

protocol UserService {
    func getUser(login: String) -> User?
}
