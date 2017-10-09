//
//  TVShowCell.swift
//  TVMazeApp
//
//  Created by Adrian Tabirta on 09.10.2017.
//  Copyright © 2017 Adrian Tabirta. All rights reserved.
//

import UIKit

final class TVShowCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel?
	@IBOutlet weak var descriptionLabel: UILabel?
	@IBOutlet weak var coverImageView: UIImageView?
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func configure(_ show: Movie) -> Self {
		return self
	}
}
