//
//  ViewController.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit

class TrendingRespostriesViewController: UIViewController {

    private lazy var networkError : NetworkErrorView = {
        let error = NetworkErrorView()
        error.translatesAutoresizingMaskIntoConstraints = false
        return error
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .universalColor1
        
        
        view.addSubview(networkError)
        networkError
        .alignAllEdgesWithSuperview()
        
        self.title = "Trending"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
          networkError.startAnimating()
    }
    
}

