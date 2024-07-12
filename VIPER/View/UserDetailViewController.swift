//
//  UserDetailViewController.swift
//  VIPER
//
//  Created by Cyril Kardash on 12.07.2024.
//

import UIKit

class UserDetailViewController: UIViewController, UserDetailViewProtocol {
    var presenter: UserDetailPresenterProtocol?
    
    private let detailUserTableView = UITableView()
    
    func updateView() {
        detailUserTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
        detailUserTableView.dataSource = presenter?.dataSource
        detailUserTableView.delegate = presenter?.delegate
        detailUserTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        setupUsersTableView()
    }
    
    private func setupUsersTableView() {
        view.addSubview(detailUserTableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailUserTableView.frame = view.bounds
    }
}
