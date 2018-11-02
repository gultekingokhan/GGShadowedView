//
//  GGShadowedView.swift
//  GGShadowedView
//
//  Created by Gokhan Gultekin on 1.11.2018.
//

import UIKit

@objc protocol GGShadowedViewProtocol {
    func didTapped(sender: GGShadowedView)
}

@IBDesignable
open class GGShadowedView: UIView {
    
    //Public constant variables
    public var scaleRatio: CGFloat = 0.9
    public var scaleDuration: TimeInterval = 0.2
    public var startShadowOpacity: Float = 0.70
    public var endShadowOpacity: Float = 0.50
    
    @IBOutlet private var contentView: UIView!
    
    @IBOutlet var delegate: GGShadowedViewProtocol?
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet { contentView.layer.cornerRadius = self.cornerRadius }
    }
    
    @IBInspectable public var bgColor: UIColor = UIColor.black {
        didSet { contentView.backgroundColor = bgColor }
    }
    //TODO: Do not change background color from storyboard. Use designables instead.
    
    @IBInspectable public var isTappable: Bool = true {
        didSet {
            setIsTappable(isTappable: isTappable)
        }
    }
    
    func setIsTappable(isTappable: Bool) {
        if isTappable {
            
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
            longPress.minimumPressDuration = 0
            contentView.addGestureRecognizer(longPress)
            
        } else {
            if gestures.count != 0 {
                for gesture in gestures { contentView.removeGestureRecognizer(gesture) }
            }
        }
    }
    
    var gestures: [UIGestureRecognizer] {
        guard let gestures = contentView.gestureRecognizers else { return [] }
        return gestures
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.black {
        didSet {
            contentView.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    override open func prepareForInterfaceBuilder() {
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        let containingBundle = Bundle(for: GGShadowedView.self)
        let bundleURL = containingBundle.url(forResource: "GGShadowedView", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        bundle?.loadNibNamed("GGShadowedView", owner: self, options: nil)
        
        addSubview(contentView)
        sendSubviewToBack(contentView)
        
        backgroundColor = UIColor.clear
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.dropShadow()
    }
    
    @objc func longPress(gesture: UILongPressGestureRecognizer) {
        
        switch gesture.state {
        case .began:
            
            delegate?.didTapped(sender: self)
            
            UIView.animate(withDuration: scaleDuration) {
                self.transform = CGAffineTransform(scaleX: self.scaleRatio, y: self.scaleRatio)
                self.contentView.layer.shadowOpacity = self.startShadowOpacity
            }
            break
        case .ended:
            UIView.animate(withDuration: scaleDuration) {
                self.transform = CGAffineTransform.identity
                self.contentView.layer.shadowOpacity = self.endShadowOpacity
            }
            break
        default:
            break
        }
    }
}

private extension UIView {
    
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0);
        layer.shadowOpacity = 0.70
        layer.shadowRadius = 12
        layer.shadowColor = UIColor.lightGray.cgColor
    }
}
