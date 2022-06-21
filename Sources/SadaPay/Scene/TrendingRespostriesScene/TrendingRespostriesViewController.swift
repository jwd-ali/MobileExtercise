//
//  ViewController.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit

class TrendingRespostriesViewController: SkeletonTableViewClass {
    
    // MARK: - Views
    private lazy var networkError : NetworkErrorView = {
        let error = NetworkErrorView()
        error.translatesAutoresizingMaskIntoConstraints = false
        return error
    }()
    
    private lazy var refreshControl : UIRefreshControl = {
      let refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: "Pull to refresh")
        return refresh
    }()
    
    // MARK: - Properties
    var viewModel: TrendingRespostriesViewModelType
    
    // MARK: - Init
    init(viewModel: TrendingRespostriesViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        setup()
        bind()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .universalColor1
        self.title = viewModel.getTitle()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       requestData()
    }
    
    private func requestData() {
        viewModel.requestTrendingData()
    }
}

//MARK:- Setup View
private extension TrendingRespostriesViewController {
    func setup() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        tableView.register(TrendingRespostriesTableCellView.self, forCellReuseIdentifier: TrendingRespostriesTableCellView.reuseableIdentifier)
        
        tableView.addSubview(refreshControl)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        view.addSubview(tableView)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        // Code to refresh table view
        viewModel.requestTrendingData()
    }
    
    func setupConstraints() {
        tableView
            .alignAllEdgesWithSuperview()
    }
    
    func bind() {
        self.viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.stopLoading()
                
            }
        }
        
        self.viewModel.showNetworkErrorClosure = {[weak self] in
             DispatchQueue.main.async {
                self?.showNetworkError()
            }
        }
    }
    
    func showNetworkError() {
         self.stopLoading()
        
        view.addSubview(networkError)
        
        networkError
        .alignAllEdgesWithSuperview()
        
        networkError.retryClosure = { [weak self] in
            self?.networkError.removeFromSuperview()
            self?.tableView.showSkeletonAnimation()
            self?.requestData()
        }
        
        DispatchQueue.main.async {
            self.networkError.startAnimating()
        }
       
    }
    
    func stopLoading() {
        self.tableView.stopAndHideAnimation()
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
}

//MARK:- TableView Delegate
extension TrendingRespostriesViewController: UITableViewDelegate {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let vm = viewModel.tableViewCellViewModel(for: indexPath) else {return UITableViewCell()}
        let cell = TrendingRespostriesTableCellView.dequeue(tableView: tableView)
        cell.configure(with: vm)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        viewModel.prefetch()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TrendingRespostriesTableCellView {
            cell.loadImage()
        }
    }
}

