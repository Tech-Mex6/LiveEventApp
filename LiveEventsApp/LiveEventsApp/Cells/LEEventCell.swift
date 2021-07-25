//
//  LEEventCell.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/24/21.
//

import UIKit

@available(iOS 13.0, *)
class LEEventCell: UITableViewCell {
    static let reuseID = "EventCell"
    let eventImageView = EventImageView(frame: .zero)
    let bodyLabel = LEBodyLabel(textAlignment: .right)
    let locationLabel = LESecondaryTitleLabel(fontSize: 18)
    let timeLabel = LESecondaryTitleLabel(fontSize: 18)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(event: Event, performer: Performer ) {
        eventImageView.downloadImage(fromURL: performer.image)
        bodyLabel.text = event.title
        locationLabel.text = "\(event.venue)"
        timeLabel.text = event.dateTimeLocal.convertToDayMonthYearFormat()
        
    }
    
    private func configure() {
        addSubViews(eventImageView, bodyLabel, locationLabel, timeLabel)
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            eventImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            eventImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            eventImageView.heightAnchor.constraint(equalToConstant: 60),
            eventImageView.widthAnchor.constraint(equalToConstant: 60),
            
            bodyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            bodyLabel.heightAnchor.constraint(equalToConstant: 40),
            
            locationLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            timeLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
