//
//  EventImageView.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/23/21.
//

import UIKit

@available(iOS 13.0, *)
class EventImageView: UIImageView {
    let cache = NetworkManager.shared.cache
    let placeHolderImage = UIImage(systemName: "photo")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius                        = 10
        clipsToBounds                             = true
        image                                     = placeHolderImage
        contentMode                               = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
