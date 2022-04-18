//
//  UITableView+Extension.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import UIKit

extension UITableView {
    
    func registerCell<T>(_ cellClass: T.Type) {
        let className = String(describing: cellClass)
        let cellNib = UINib(nibName: className, bundle: nil)
        register(cellNib, forCellReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type,
                                                 indexPath: IndexPath) -> T {
        let className = String(describing: cellClass)
        return self.dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type,
                                                 identifier: String,
                                                 indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}
