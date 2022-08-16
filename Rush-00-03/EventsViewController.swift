//
//  EventsViewController.swift
//  Rush00
//
//  Created by Сергей Хмизюк on 16.08.2022.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event.allEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        cell.textLabel?.text = Event.allEvents[indexPath.row].title
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let eventsTableView = UITableView()
        eventsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "eventCell")
        eventsTableView.dataSource = self
        view.addSubview(eventsTableView)
        
        eventsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        eventsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        eventsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        eventsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        eventsTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        eventsTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        eventsTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        eventsTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }

}
