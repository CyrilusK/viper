//
//  UserTableViewDataSource.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

class UserTableViewDataSource: NSObject, UITableViewDataSource {
    private let presenter: UserPresenterProtocol
    
    init(presenter: UserPresenterProtocol) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = presenter.users[indexPath.row].name
        return cell
    }
}
