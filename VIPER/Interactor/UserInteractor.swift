//
//  Interactor.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

//object
//protocol
//reference - presenter


class UserInteractor: UserInteractorProtocol {
    var presenter: UserPresenterProtocol?
    
    func getUsers() {
        print("[DEBUG] - Start fetching")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            }
            catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}
