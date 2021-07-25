//
//  EventListVC.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/24/21.
//

import UIKit

@available(iOS 13.0, *)
class EventListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var events: [Event] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight  = 90
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LEEventCell.reuseID, for: indexPath) as? LEEventCell else { fatalError() }
        let event = events[indexPath.row]
        cell.set(event: event, performer: event.performers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
