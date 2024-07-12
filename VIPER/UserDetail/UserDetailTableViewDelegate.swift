//
//  UserDetailTableViewDelegate.swift
//  VIPER
//
//  Created by Cyril Kardash on 12.07.2024.
//

import UIKit

class UserDetailTableViewDelegate: NSObject, UITableViewDelegate {
    private let presenter: UserDetailPresenterProtocol
    
    init(presenter: UserDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
