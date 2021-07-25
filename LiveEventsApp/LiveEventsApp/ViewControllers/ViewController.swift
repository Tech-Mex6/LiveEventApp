//
//  ViewController.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/22/21.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    let callToActionButton = LEButton(backgroundColor: .systemTeal, title: "Get Events")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(callToActionButton)
        
        configureCallToActionButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func pushEventListVC() {
        let eventListVC = EventListVC()
        navigationController?.pushViewController(eventListVC, animated: true)
    }
    
    func configureCallToActionButton() {
        callToActionButton.addTarget(self, action: #selector(pushEventListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

