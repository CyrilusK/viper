//
//  UserConfigurator.swift
//  VIPER
//
//  Created by Cyril Kardash on 12.07.2024.
//

import UIKit

class UserConfigurator: UserConfiguratorProtocol {
    static func configure() -> UIViewController {
        let view = UserViewController()
        let presenter = UserPresenter()
        let interactor = UserInteractor()
        let router = UserRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.entry = view
        
        return view
    }
}

