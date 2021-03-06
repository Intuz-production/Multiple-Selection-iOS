//
//  UIButtonExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension UIButton {
	/// EZSwiftExtensions

	// swiftlint:disable function_parameter_count
	public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, target: AnyObject, action: Selector) {
		self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        addTarget(target, action: action, for: UIControl.Event.touchUpInside)
	}
	// swiftlint:enable function_parameter_count

	/// EZSwiftExtensions
    public func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
		UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
		UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
		let colorImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		self.setBackgroundImage(colorImage, for: forState)
	}
}


// MARK: - Properties
public extension UIButton {
    
    @IBInspectable
    /// SwifterSwift: Image of disabled state for button; also inspectable from Storyboard.
    var imageForDisabled: UIImage? {
        get {
            return image(for: .disabled)
        }
        set {
            setImage(newValue, for: .disabled)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Image of highlighted state for button; also inspectable from Storyboard.
    var imageForHighlighted: UIImage? {
        get {
            return image(for: .highlighted)
        }
        set {
            setImage(newValue, for: .highlighted)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Image of normal state for button; also inspectable from Storyboard.
    var imageForNormal: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Image of selected state for button; also inspectable from Storyboard.
    var imageForSelected: UIImage? {
        get {
            return image(for: .selected)
        }
        set {
            setImage(newValue, for: .selected)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title color of disabled state for button; also inspectable from Storyboard.
    var titleColorForDisabled: UIColor? {
        get {
            return titleColor(for: .disabled)
        }
        set {
            setTitleColor(newValue, for: .disabled)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title color of highlighted state for button; also inspectable from Storyboard.
    var titleColorForHighlighted: UIColor? {
        get {
            return titleColor(for: .highlighted)
        }
        set {
            setTitleColor(newValue, for: .highlighted)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title color of normal state for button; also inspectable from Storyboard.
    var titleColorForNormal: UIColor? {
        get {
            return titleColor(for: .normal)
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title color of selected state for button; also inspectable from Storyboard.
    var titleColorForSelected: UIColor? {
        get {
            return titleColor(for: .selected)
        }
        set {
            setTitleColor(newValue, for: .selected)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title of disabled state for button; also inspectable from Storyboard.
    var titleForDisabled: String? {
        get {
            return title(for: .disabled)
        }
        set {
            setTitle(newValue, for: .disabled)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title of highlighted state for button; also inspectable from Storyboard.
    var titleForHighlighted: String? {
        get {
            return title(for: .highlighted)
        }
        set {
            setTitle(newValue, for: .highlighted)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title of normal state for button; also inspectable from Storyboard.
    var titleForNormal: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    @IBInspectable
    /// SwifterSwift: Title of selected state for button; also inspectable from Storyboard.
    var titleForSelected: String? {
        get {
            return title(for: .selected)
        }
        set {
            setTitle(newValue, for: .selected)
        }
    }
    
}


// MARK: - Methods
public extension UIButton {
    
    private var states: [UIControl.State] {
        return [.normal, .selected, .highlighted, .disabled]
    }
    
    /// SwifterSwift: Set image for all states.
    ///
    /// - Parameter image: UIImage.
    func setImageForAllStates(_ image: UIImage) {
        states.forEach { self.setImage(image, for:  $0) }
    }
    
    /// SwifterSwift: Set title color for all states.
    ///
    /// - Parameter color: UIColor.
    func setTitleColorForAllStates(_ color: UIColor) {
        states.forEach { self.setTitleColor(color, for: $0) }
    }
    
    /// SwifterSwift: Set title for all states.
    ///
    /// - Parameter title: title string.
    func setTitleForAllStates(_ title: String) {
        states.forEach { self.setTitle(title, for: $0) }
    }
    
}
