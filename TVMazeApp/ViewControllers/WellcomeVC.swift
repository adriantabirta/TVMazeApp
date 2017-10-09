//
//  WellcomeVC.swift
//  TVMazeApp
//
//  Created by Adrian Tabirta on 07.10.2017.
//  Copyright © 2017 Adrian Tabirta. All rights reserved.
//

import UIKit

class WellcomeVC: UIViewController, StoryboardInitable, UIScrollViewDelegate {
	static var storyboardName: String { return "Main" }
	
	@IBOutlet weak var pageControl: UIPageControl!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
		pageControl.currentPage = page
	}
	
	@IBAction func startMain() {
		Model.shared.router.startMainScreen()
	}
}
