//
//  UIView+Extension.swift
//  Repositories
//
//  Created by Rajeev on 19/04/22.
//

import Foundation
import SkeletonView

public extension UIView {
    
    func showHDAnimatedGradientSkeleton() {
        showAnimatedGradientSkeleton { (layer) -> CAAnimation in
            
            let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
            startPointAnim.fromValue = CGPoint(x: -1, y: 0.5)
            startPointAnim.toValue = CGPoint(x:1, y: 0.5)
            
            let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
            endPointAnim.fromValue = CGPoint(x: 0, y: 0.5)
            endPointAnim.toValue = CGPoint(x:2, y: 0.5)
            
            let animGroup = CAAnimationGroup()
            animGroup.animations = [startPointAnim, endPointAnim]
            animGroup.duration = 0.8
            animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
            animGroup.repeatCount = .infinity
            animGroup.fillMode = CAMediaTimingFillMode.forwards;
            animGroup.isRemovedOnCompletion = false;
            
            return animGroup
        }
    }
}
