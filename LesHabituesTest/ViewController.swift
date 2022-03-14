//
//  ViewController.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = ViewModel()
    let tableView = UITableView(frame: .zero, style: .plain)
    let indicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureActivity()
        viewModel.fetchShops(completion: displayShops, onError: displayError)
    }
    
    // MARK: Configure
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.register(HabituesTableViewCell.self, forCellReuseIdentifier: HabituesTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    private func configureActivity() {
        indicator.center = self.view.center
        tableView.addSubview(indicator)
        indicator.startAnimating()
    }
    
    // MARK: Display
    
    func displayShops() {
        indicator.stopAnimating()
        tableView.reloadData()
    }
    
    func displayError() {
        indicator.stopAnimating()
        let alert = UIAlertController(title: "Error", message: "Oops something went wrong", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model?.data.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HabituesTableViewCell.cellIdentifier, for: indexPath) as? HabituesTableViewCell {
            cell.set(shop: viewModel.model?.data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
