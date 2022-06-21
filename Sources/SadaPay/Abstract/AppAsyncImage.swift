//
//  AppAsyncImage.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Kingfisher
import UIKit
struct AppAsyncImage {
    
    func loadImage(for url: URL,placeHolder: UIImage? = nil, in view:UIImageView) {
        view.kf.indicatorType = .activity
        
        if url.isFileURL{
            let provider = LocalFileImageDataProvider(fileURL: url)
            view.kf.setImage(with: provider)
        } else {
            var options : KingfisherOptionsInfo? = []
            options?.append(.transition(.fade(0.2)))
            view.kf.setImage(with: url, placeholder: placeHolder, options: options, progressBlock: nil) { (result) in
            }
        }
    }
    
    func prefetchImages(for urls:[URL]){
        
        let prefetcher = ImagePrefetcher(urls: urls) {
            skippedResources, failedResources, completedResources in
        }
        prefetcher.start()
    }
    
}
