//
//  UIView+Ext.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/23/21.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views { addSubview(view)}
    }
}
