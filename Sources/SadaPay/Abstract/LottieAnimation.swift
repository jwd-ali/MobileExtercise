//
//  LottieAnimation.swift
//  MobileExercise
//
//  Created by Jawad Ali on 23/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
import Lottie

extension UIView {
    func showAnimation(aimationName: String, animationShouldLoop: Bool = true, animationSpeed:CGFloat = 2 ) {
        
print(bounds)
        let starAnimationView = AnimationView(name: aimationName)
        starAnimationView.frame = bounds
        addSubview(starAnimationView)
        starAnimationView.contentMode = .scaleAspectFill
        starAnimationView.loopMode = animationShouldLoop ? .loop : .playOnce
        starAnimationView.animationSpeed = animationSpeed
        starAnimationView.play()
    }
}
