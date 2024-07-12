//
//  UserTableViewDelegate.swift
//  VIPER
//
//  Created by Cyril Kardash on 11.07.2024.
//

import UIKit

class UserTableViewDelegate: NSObject, UITableViewDelegate {
    private let presenter: UserPresenterProtocol
    
    init(presenter: UserPresenterProtocol) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = presenter.users[indexPath.row]
        print("[DEBUG] - WillTapCell")
        presenter.didSelectUser(user)
    }
}
