//
//  EventsViewController.swift
//  Rush00
//
//  Created by Сергей Хмизюк on 16.08.2022.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event.allEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        cell.textLabel?.text = Event.allEvents[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell \(indexPath.row)")
        
        let second = SubscribeViewController()

        let navVC = UINavigationController(rootViewController: second)
        navVC.modalPresentationStyle = .fullScreen

        second.event = Event.allEvents[indexPath.row]
        
        navigationController!.pushViewController(second, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let eventsTableView = UITableView()
        eventsTableView.allowsSelection = true
        eventsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "eventCell")
        eventsTableView.dataSource = self
        view.addSubview(eventsTableView)
        
        eventsTableView.delegate = self
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        
        let subscribeViewController = segue.destination as! SubscribeViewController
        subscribeViewController.eventDate = cell.textLabel?.text
        
//        print(cell.textLabel?.text)
    }

}
