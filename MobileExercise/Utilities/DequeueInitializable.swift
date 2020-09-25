//
//  DequeueInitializable.swift
//  MobileExercise
//
//  Created by Jawad Ali on 24/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
protocol DequeueInitializable {
    static var reuseableIdentifier: String { get }
}

extension DequeueInitializable where Self: UITableViewCell {
    
    static var reuseableIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func dequeue(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseableIdentifier) else {
            return UITableViewCell() as! Self
        }
        return cell as! Self
    }
    
    
}
