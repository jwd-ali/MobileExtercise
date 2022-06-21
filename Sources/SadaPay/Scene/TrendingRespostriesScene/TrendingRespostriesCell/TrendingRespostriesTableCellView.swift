//
//  TrendingRespostriesTableCellView.swift
//  MobileExercise
//
//  Created by Jawad Ali on 24/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
class TrendingRespostriesTableCellView: UITableViewCell, DequeueInitializable {
    
    // MARK: Views
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var authorNameLabel: UILabel = UILabelFactory.createUILabel(with: UIColor.universalColor5, font: UIFont.systemFont(ofSize: FontSize.medium.rawValue), alignment: .left, text:" " )
    
    private lazy var respositoryNameLabel: UILabel = UILabelFactory.createUILabel(with: UIColor.universalColor3, font: UIFont.boldSystemFont(ofSize: FontSize.large.rawValue), alignment: .left,  text:" " )
    
    private lazy var DescriptionLabel: UILabel = UILabelFactory.createUILabel(with: UIColor.universalColor5, font: UIFont.systemFont(ofSize: FontSize.small.rawValue), alignment: .left, numberOfLines: 0, text: " ")
    
    private lazy var languageLabel: UILabel = UILabelFactory.createUILabel(with: UIColor.universalColor3, font: UIFont.systemFont(ofSize: FontSize.medium.rawValue), alignment: .left)
    
    private lazy var langaugeColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var starsLabel: UILabel = UILabelFactory.createUILabel(with: UIColor.universalColor3, font: UIFont.systemFont(ofSize: FontSize.medium.rawValue), alignment: .left)
    
    private lazy var verticalStack: UIStackView = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fill, spacing: 10, arrangedSubviews: [authorNameLabel, respositoryNameLabel, DescriptionLabel, languageStarStack])
    
    
    private lazy var languageStarStack: UIStackView = UIStackViewFactory.createStackView(with: .horizontal, alignment: .center, distribution: .fill, spacing: 10, arrangedSubviews:[langaugeColorView, languageLabel, starsLabel,UIView()] )
    
    private lazy var seperator: UIView = {
           let view = UIView()
            view.backgroundColor = .universalColor4
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    //MARK:- Properties
    
    private var viewModel: TrendingRespostriesTableCellViewModelType?
    
    // MARK: Initialization
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: Configurations
    
    func configure(with viewModel:TrendingRespostriesTableCellViewModelType) {
        self.viewModel = viewModel
        binding()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.midY
        langaugeColorView.layer.cornerRadius = langaugeColorView.bounds.midY
    }

    
    func loadImage() {
        if let url = viewModel?.getAvatarURL() {
            AppAsyncImage().loadImage(for: url, in: avatarImageView)
        }
    }
}

// MARK: View setup

private extension TrendingRespostriesTableCellView {
    func setupViews() {
        
        subscribeToShimmerView([self,avatarImageView,authorNameLabel,verticalStack,respositoryNameLabel,DescriptionLabel,languageStarStack])
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(verticalStack)
        contentView.addSubview(seperator)
    }
    func setupConstraints() {
    
        avatarImageView
            .alignEdgesWithSuperview([.top,.left],constant:10)
            .height(constant: 50)
            .width(constant: 50)
        
        langaugeColorView
            .height(constant: 10)
            .width(constant: 10)
        
        languageStarStack
            .setCustomSpacing(30, after: languageLabel)
        
        verticalStack
            .toRightOf(avatarImageView, constant:10)
            .alignEdgesWithSuperview([.top, .right, .bottom], constant:15)
        
        seperator
            .alignEdgesWithSuperview([.left, .right], constant:10)
            .height(constant: 1)
            .alignEdgeWithSuperview(.bottom, constant: 1)
    }
}

//MARK:- View Binding

private extension TrendingRespostriesTableCellView {
    
    func binding() {
        authorNameLabel.text = viewModel?.getAuthorName()
        respositoryNameLabel.text = viewModel?.getRespostryName()
        starsLabel.text = viewModel?.getStars()
        languageLabel.text = viewModel?.getLanguage()
        langaugeColorView.backgroundColor = UIColor(hexString: viewModel?.getLanguageColor() ?? "")
        DescriptionLabel.text = viewModel?.getDescription()
    }
    
}
