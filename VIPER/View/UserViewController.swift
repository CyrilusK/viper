//
//  View.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

//VC
//protocol
//reference - presenter

class UserViewController: UIViewController, UserViewProtocol {
    var presenter: UserPresenterProtocol?
    
    // MARK: - UI components
    private let usersTableView = UITableView()
    private let errorLabel = UILabel()
    
    // MARK: - Private methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        usersTableView.delegate = presenter?.delegate
        usersTableView.dataSource = presenter?.dataSource
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        setupUsersTableView()
        setupErrorLabel()
    }
    
    private func setupUsersTableView() {
        view.addSubview(usersTableView)
    }
    
    private func setupErrorLabel() {
        view.addSubview(errorLabel)
        errorLabel.textAlignment = .center
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        usersTableView.frame = view.bounds
        errorLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        errorLabel.center = view.center
    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
            self.errorLabel.isHidden = true
        }
    }

    func updateData(with error: String) {
        DispatchQueue.main.async {
            self.usersTableView.isHidden = true
            self.errorLabel.text = error
        }
    }
}


