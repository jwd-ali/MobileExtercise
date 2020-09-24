//
//  NetworkErrorView.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
class NetworkErrorView: UIView {
    
    private lazy var animationView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var retryButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderColor = #colorLiteral(red: 0.2367406189, green: 0.7596899867, blue: 0.4115455151, alpha: 1)
        button.layer.borderWidth = 2
        button.setTitleColor(#colorLiteral(red: 0.2367406189, green: 0.7596899867, blue: 0.4115455151, alpha: 1), for: .normal)
        button.backgroundColor = .clear
        button.setTitle("RETERY", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var titleLabel = UILabelFactory.createUILabel(with: UIColor.universalColor3, font: UIFont.boldSystemFont(ofSize: FontSize.large.rawValue), alignment: .center, text: "Something went wrong..")
    
    private lazy var descriptionLabel = UILabelFactory.createUILabel(with: UIColor.universalColor4, font: UIFont.systemFont(ofSize: FontSize.medium.rawValue), alignment: .center, text: "An alien probably blocking your signal.")
    
    private lazy var stack = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fill, spacing: 5, arrangedSubviews: [animationView,titleLabel,descriptionLabel])
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
         commonInit()
    }
    
    private func commonInit() {
        
        setupView()
        setupConstraints()
       
    }
    
    public func startAnimating() {
        animationView.showAnimation(aimationName: "4506-retry-and-user-busy-version-2")
    }
}
private extension NetworkErrorView {
    func setupView() {
        addSubview(stack)
        addSubview(retryButton)
        
       
    }
    func setupConstraints(){
        
        retryButton
            .alignEdgesWithSuperview([.left, .right], constant: 20)
            .alignEdgeWithSuperviewSafeArea(.bottom, constant:20)
            .height(constant: 50)
        
        stack
            .toTopOf(retryButton, .greaterThanOrEqualTo, constant:20)
            .alignEdgeWithSuperviewSafeArea(.top, .greaterThanOrEqualTo , constant: 40)
            .alignEdgesWithSuperview([.left, .right], constant: 30)
        
        
        stack
            .setCustomSpacing(30, after: animationView)
        
        animationView
            .height(with: .height, ofView: self, multiplier: 0.4)
            
        
        
    }
    
   
}
