//
//  Router.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

//object
//entry point

typealias EntryPoint = UIViewController & UserViewProtocol

class UserRouter: UserRouterProtocol {
    var entry: EntryPoint?
    
    static func start() -> UserRouterProtocol {
        let router = UserRouter()
        //assign VIP
        var view: UserViewProtocol = UserViewController()
        var presenter: UserPresenterProtocol = UserPresenter()
        var interactor: UserInteractorProtocol = UserInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
