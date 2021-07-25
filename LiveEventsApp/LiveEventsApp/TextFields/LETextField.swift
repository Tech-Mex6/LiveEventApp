//
//  LETextField.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/23/21.
//

import UIKit

@available(iOS 13.0, *)
class LETextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius                        = 10
        layer.borderWidth                         = 2
        layer.borderColor                         = UIColor.systemGray4.cgColor
        
        textColor                 = .label
        tintColor                 = .label
        textAlignment             = .left
        font                      = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize           = 12
        
        backgroundColor    = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType      = .go
        clearButtonMode    = .whileEditing
        placeholder        = "Search events"
        
    }
}
