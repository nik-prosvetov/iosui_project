//
//  ExtensionUIView.swift
//  Navigation
//
//  Created by Serge Kotov on 07.06.2022.
//

import UIKit

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for i in subviews {
            self.addSubview(i)
        }
    }
}
