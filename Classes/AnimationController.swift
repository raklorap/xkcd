//
//  AnimationController.swift
//  xkcd
//
//  Created by Rohan Parolkar on 7/27/16.
//
//

import UIKit

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
        
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        //  Push from center animation
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()
        toViewController.view.frame = finalFrameForVC
        //  Start off with a small frame
        toViewController.view.transform = CGAffineTransformMakeScale(0.1,0.1)
        containerView!.addSubview(toViewController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
            fromViewController.view.alpha = 0.5
            //  Enlarge to completion
            toViewController.view.transform = CGAffineTransformIdentity
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
                fromViewController.view.alpha = 1.0
        })
        
    }
}