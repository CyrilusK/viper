//
//  Presenter.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

//object
//porotocol
//references - view, router, interactor

class UserPresenter: UserPresenterProtocol {
    var router: UserRouterProtocol?
    
    var view: UserViewProtocol?
    
    var interactor: UserInteractorProtocol? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var users = [User]()
    
    var dataSource: UITableViewDataSource?
    var delegate: UITableViewDelegate?
    
    init() {
        self.dataSource = UserTableViewDataSource(presenter: self)
        self.delegate = UserTableViewDelegate(presenter: self)
    }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.updateData()
            self.users = users
        case .failure:
            view?.updateData(with: "Something went wrong")
        }
    }
    
    func didSelectUser(_ user: User) {
        print("[DEBUG] - DidTapCell")
        router?.navigateToUserDetail(with: user)
    }
}
