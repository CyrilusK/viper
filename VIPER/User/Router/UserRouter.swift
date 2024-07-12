//
//  Router.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

//object
//entry point

class UserRouter: UserRouterProtocol {
    weak var entry: UIViewController?
    
    func navigateToUserDetail(with user: User) {
        let userDetailViewController = UserDetailConfigurator.configure(with: user)
        entry?.present(userDetailViewController, animated: true)
    }
}
