//
//  ViewController.swift
//  tableViewProgamatico
//
//  Created by EdgardVS on 30/03/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    let tableView: UITableView = {
        let table = UITableView()
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    // clase especifica para las aliniaciones de las sub vistas de la view principal
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //toda la pantalla
        //tableView.frame = view.bounds
        tableView.frame = .zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //constrains para respetar el safe area programaticamente
        //====
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        //====
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
        as? CustomTableViewCell else { return UITableViewCell()}
//        cell.textLabel?.text = "Grade \(indexPath.row+1)"
//        cell.imageView?.image = UIImage(systemName: "house")
//        cell.imageView?.tintColor = .systemGreen
        cell.configure(text: "Custom \(indexPath.row + 1)", imageName: indexPath.row % 2 == 0 ? "Image1" : "Image2")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


}

