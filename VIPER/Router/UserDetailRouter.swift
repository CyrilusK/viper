//
//  UserDetailRouter.swift
//  VIPER
//
//  Created by Cyril Kardash on 12.07.2024.
//

import UIKit


class UserDetailRouter: UserDetailRouterProtocol {
    var entry: UserDetailViewController?
    
    static func start(with user: User) -> UserDetailRouterProtocol {
        let router = UserDetailRouter()
        let view: UserDetailViewProtocol = UserDetailViewController()
        let presenter: UserDetailPresenterProtocol = UserDetailPresenter(user: user)
        
        view.presenter = presenter
        presenter.view = view
        
        router.entry = view as? UserDetailViewController
        
        return router
    }
    
}
