//
//  UITableView+Extension.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 23/11/2021.
//

import UIKit

extension UITableView {
    func register<T : UITableViewCell>(cell: T.Type) {
        register(cell.nibFromClass, forCellReuseIdentifier: cell.nameOfClass)
    }
    
    func dequeue<T : UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: cell.nameOfClass, for: indexPath) as! T
    }
    
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
