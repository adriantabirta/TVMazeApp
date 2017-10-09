//
//  Router.swift
//  TVMazeApp
//
//  Created by Adrian Tabirta on 09.10.2017.
//  Copyright © 2017 Adrian Tabirta. All rights reserved.
//

import UIKit

final class AppRouter {

	fileprivate let rootNavigationController: UINavigationController = {
		let nc = Model.shared.window!.rootViewController as! UINavigationController
		return nc
	}()
	
	func startWelcomeTourScreen() {
		rootNavigationController.setNavigationBarHidden(true, animated: false)
		rootNavigationController.setViewControllers([welcomeScreen], animated: true)
	}
	
	func startMainScreen() {
		rootNavigationController.setNavigationBarHidden(false, animated: false)
		rootNavigationController.setViewControllers([mainScreen], animated: true)
	}
	
	fileprivate lazy var welcomeScreen = WellcomeVC.instantiateViaStoryboard()
	fileprivate lazy var mainScreen = MainViewController.instantiateViaStoryboard()

}

