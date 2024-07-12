//
//  Protocols.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit


protocol UserViewProtocol: AnyObject {
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

protocol UserPresenterProtocol: AnyObject {
    /// - Parameters:
    var router: UserRouterProtocol? { get set }
    var view: UserViewProtocol? { get set }
    var interactor: UserInteractorProtocol? { get set }
    
    var users: [User] { get }
    
    var dataSource: UITableViewDataSource? { get }
    var delegate: UITableViewDelegate? { get }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func didSelectUser(_ user: User)
    func viewDidLoad()
}

protocol UserRouterProtocol {
    /// - Parameters:
    var entry: UIViewController? { get }
    
    func navigateToUserDetail(with user: User)
}

protocol UserConfiguratorProtocol {
    static func configure() -> UIViewController
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

protocol UserDetailConfiguratorProtocol {
    static func configure(with user: User) -> UIViewController
}

protocol UserDetailRouterProtocol: AnyObject {
}

