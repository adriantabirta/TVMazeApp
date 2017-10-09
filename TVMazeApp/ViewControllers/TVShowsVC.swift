//
//  TVShowsVC.swift
//  TVMazeApp
//
//  Created by Adrian Tabirta on 09.10.2017.
//  Copyright © 2017 Adrian Tabirta. All rights reserved.
//

import UIKit

final class TVShowsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TVShowsVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return (tableView.dequeueCell(for: indexPath) as! TVShowCell)
	}
}
