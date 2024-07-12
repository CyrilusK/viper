//
//  Protocols.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit


protocol UserViewProtocol {
    /// - Parameters:
    var presenter: UserPresenterProtocol? { get set }
    
    func updateData()
    func updateData(with error: String)
}

protocol UserInteractorProtocol {
    /// - Parameters:
    var presenter: UserPresenterProtocol? { get set }
    
    func getUsers()
}

protocol UserPresenterProtocol {
    /// - Parameters:
    var router: UserRouterProtocol? { get set }
    var view: UserViewProtocol? { get set }
    var interactor: UserInteractorProtocol? { get set }
    
    var users: [User] { get }
    
    var dataSource: UITableViewDataSource? { get }
    var delegate: UITableViewDelegate? { get }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func didSelectUser(_ user: User)
}

protocol UserRouterProtocol {
    /// - Parameters:
    var entry: EntryPoint? { get }
    
    static func start() -> UserRouterProtocol
    func navigateToUserDetail(with user: User)
}

protocol UserDetailViewProtocol: AnyObject {
    /// - Parameters:
    var presenter: UserDetailPresenterProtocol? { get set }
    
    func updateView()
}

protocol UserDetailPresenterProtocol: AnyObject {
    /// - Parameters:
    var view: UserDetailViewProtocol? { get set }
    var user: User { get }
    
    var dataSource: UITableViewDataSource? { get }
    var delegate: UITableViewDelegate? { get }
    
    func viewDidLoad()
}

protocol UserDetailRouterProtocol: AnyObject {
    /// - Parameters:
    var entry: UserDetailViewController? { get }
    
    static func start(with user: User) -> UserDetailRouterProtocol
}
