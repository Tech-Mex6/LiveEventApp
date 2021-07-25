//
//  LESecondaryTitleLabel.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/23/21.
//

import UIKit

@available(iOS 13.0, *)
class LESecondaryTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    @available(iOS 13.0, *)
    private func configure() {
        textColor                                 = .secondaryLabel
        adjustsFontSizeToFitWidth                 = true
        minimumScaleFactor                        = 0.9
        lineBreakMode                             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

