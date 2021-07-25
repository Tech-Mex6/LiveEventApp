//
//  LEAlertContainerView.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/23/21.
//

import UIKit

@available(iOS 13.0, *)
class LEAlertContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor                           = .systemBackground
        layer.cornerRadius                        = 16
        layer.borderWidth                         = 2
        layer.borderColor                         = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
