//
//  UserDetailPresenter.swift
//  VIPER
//
//  Created by Cyril Kardash on 12.07.2024.
//

import UIKit


class UserDetailPresenter: UserDetailPresenterProtocol {
    var view: UserDetailViewProtocol?
    var user: User
    
    var dataSource: UITableViewDataSource?
    var delegate: UITableViewDelegate?
    
    init(user: User) {
        self.user = user
        self.dataSource = UserDetailTableDataSource(presenter: self)
        self.delegate = UserDetailTableViewDelegate(presenter: self)
    }
    
    func viewDidLoad() {
        view?.updateView()
    }
}
