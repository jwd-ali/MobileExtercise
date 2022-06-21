//
//  SkeletonTableView.swift
//  MobileExercise
//
//  Created by Jawad Ali on 25/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
import SkeletonView
extension UITableView {
    
    func showSkeletonAnimation()  {
        self.showAnimatedGradientSkeleton()
    }
    
    func stopAndHideAnimation() {
        self.stopSkeletonAnimation()
        self.hideSkeleton()
    }
    
    
}

extension UIView {
    
    func subscribeToShimmerView(_ views:[UIView]) {
       _ = views.map { $0.isSkeletonable = true }
    }
}

class SkeletonTableViewClass: UIViewController {
     lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 180
        table.separatorStyle = .none
        table.rowHeight = UITableView.automaticDimension
        table.isSkeletonable = true
        return table
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.tableView.showSkeletonAnimation()
    }
}
extension SkeletonTableViewClass: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return TrendingRespostriesTableCellView.reuseableIdentifier
    }
}
