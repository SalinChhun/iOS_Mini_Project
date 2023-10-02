//
//  UIViewExtension.swift
//  iOS_Mini_Project
//
//  Created by PVH_002 on 2/10/23.
//

import Foundation

import Foundation
import UIKit

extension UIView {
    func round( _ radious: CGFloat = 10) {
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
