//
//  ComicListViewController+Animation.swift
//  xkcd
//
//  Created by Rohan Parolkar on 7/27/16.
//
//

import UIKit

private let animationController = AnimationController()

extension ComicListViewController : UINavigationControllerDelegate {

    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animationController
    }

}
