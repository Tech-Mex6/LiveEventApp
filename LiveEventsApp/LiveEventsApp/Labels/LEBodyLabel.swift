//
//  LEBodyLabel.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/23/21.
//

import UIKit

@available(iOS 13.0, *)
class LEBodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    @available(iOS 13.0, *)
    private func configure() {
        textColor                                 = .secondaryLabel
        font                                      = .preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory         = true
        adjustsFontSizeToFitWidth                 = true
        minimumScaleFactor                        = 0.75
        lineBreakMode                             = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
