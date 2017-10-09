//
//  Reusable.swift
//  TVMazeApp
//
//  Created by Adrian Tabirta on 09.10.2017.
//  Copyright © 2017 Adrian Tabirta. All rights reserved.
//

import UIKit

public protocol Reusable: class {
	static var reuseIdentifier: String { get }
}

public extension Reusable {
	static var reuseIdentifier: String {
		return String(describing: Self.self)
	}
}

extension UITableView {
	
	public func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
		guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Can't dequeue reusable cell \(T.self) with identifier \(T.reuseIdentifier)")
		}
		return cell
	}
	
	public func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
		guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
			fatalError("Can't dequeue reusable header/footer \(T.self) with identifier \(T.reuseIdentifier)")
		}
		return headerFooterView
	}
	
	public func register<T: UITableViewCell>(nib: T.Type) where T: NibInitable {
		register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
	}
	
	public func register<T: UITableViewCell>(class: T.Type) where T: Reusable {
		register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
	}
	
	public func register<T: UITableViewHeaderFooterView>(headerFooterViewNib: T.Type) where T: NibInitable {
		register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
	}
	
	public func register<T: UITableViewHeaderFooterView>(headerFooterViewClass: T.Type) where T: Reusable {
		register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
	}
}


// MARK: - Reusable UIViewController
extension UIStoryboard {
	
	/// instantiate appropriate view controller
	/// view controller Storyboard ID must be the same
	/// as view controller class name
	public func instantiateViewController<T: UIViewController>() -> T where T: Reusable {
		guard let vc = self.instantiateViewController(withIdentifier: T.reuseIdentifier) as? T else {
			fatalError("Can't instantiate view controller \(T.self) with identifier \(T.reuseIdentifier)")
		}
		_ = vc.view
		return vc
	}
}

public protocol StoryboardInitable: Reusable {
	
	/// storyboard file name without extension
	static var storyboardName: String { get }
	
	/// storyboard bundle, main bundle used by default
	static var storyboardBundle: Bundle? { get }
}

public extension StoryboardInitable where Self: UIViewController {
	
	static var storyboardBundle: Bundle? { return nil }
	
	/// instantiate view controller from appropriate storyboard
	/// view controller Storyboard ID must be the same
	/// as view controller class name
	static func instantiateViaStoryboard() -> Self {
		let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
		return storyboard.instantiateViewController() as Self
	}
}

