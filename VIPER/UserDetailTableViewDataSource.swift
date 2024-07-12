//
//  UserDetailTableViewDelegate.swift
//  VIPER
//
//  Created by Cyril Kardash on 12.07.2024.
//

import UIKit

class UserDetailTableDataSource: NSObject, UITableViewDataSource {
    private let presenter: UserDetailPresenterProtocol
    
    init(presenter: UserDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Name: \(presenter.user.name)"
        case 1:
            cell.textLabel?.text = "Username: \(presenter.user.username)"
        case 2:
            cell.textLabel?.text = "Email: \(presenter.user.email)"
        case 3:
            cell.textLabel?.text = "Id: \(presenter.user.id)"
        case 4:
            cell.textLabel?.text = "Phone: \(presenter.user.phone)"
        case 5:
            cell.textLabel?.text = "Website: \(presenter.user.website)"
        default:
            break
        }
        return cell
    }
}
