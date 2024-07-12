//
//  UserDetailConfigurator.swift
//  VIPER
//
//  Created by Cyril Kardash on 12.07.2024.
//

import UIKit

class UserDetailConfigurator: UserDetailConfiguratorProtocol {
    static func configure(with user: User) -> UIViewController {
        let view = UserDetailViewController()
        let presenter = UserDetailPresenter(user: user)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
