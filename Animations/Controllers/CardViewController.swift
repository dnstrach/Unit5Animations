//
//  CardViewController.swift
//  Animations
//
//  Created by Dominique Strachan on 2/5/23.
//

import UIKit

class CardViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var violetCard: UIView!
    @IBOutlet weak var sageCard: UIView!
    @IBOutlet weak var forestCard: UIView!
    @IBOutlet weak var lavenderCard: UIView!
    
    //MARK: - Properties
    //let colors: [UIColor] = [#colorLiteral(]
    let colors: [UIColor] = [#colorLiteral(red: 0.700926125, green: 0.9971435666, blue: 0.7819232345, alpha: 1), #colorLiteral(red: 0.03046969883, green: 0.1583432555, blue: 0.02422266454, alpha: 1), #colorLiteral(red: 0.0359862186, green: 0.2629364133, blue: 0.2660630941, alpha: 1), #colorLiteral(red: 0.8304724097, green: 0.7821176052, blue: 0.9780016541, alpha: 1), #colorLiteral(red: 0.1393590271, green: 0.5622926354, blue: 0.466176033, alpha: 1), #colorLiteral(red: 0.4467694759, green: 0.400362134, blue: 0.5362829566, alpha: 1)]
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

    }
    
    //MARK: - Actions
    @IBAction func violetCardTapped(_ sender: Any) {
        rotateViolet()
    }
    
    @IBAction func sageCardTapped(_ sender: Any) {
        flipSage()
    }
    
    @IBAction func forestCardTapped(_ sender: Any) {
        changeBackgroundColor()
    }
    
    @IBAction func lavenderButtonTapped(_ sender: UIButton, forEvent event: UIEvent) {
        let touches = event.touches(for: sender)
        guard let touchPoint = touches?.first?.location(in: self.view) else { return }
        loveLavender(touchPoint: touchPoint)
    }
    
    //MARK: Helpers
    func setUpViews() {
        violetCard.layer.cornerRadius = 8.0
        sageCard.layer.cornerRadius = 8.0
        forestCard.layer.cornerRadius = 8.0
        lavenderCard.layer.cornerRadius = 8.0
    }
    
    func rotateViolet() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.violetCard.transform = self.violetCard.transform.rotated(by: .pi/2)
        }
    }
    
    func flipSage() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.sageCard.transform = self.sageCard.transform.scaledBy(x: 1, y: -1)
        }
    }
    
    func changeBackgroundColor() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.view.backgroundColor = self.colors.randomElement()
        }
    }
    
    func loveLavender(touchPoint: CGPoint) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customVerticalPath(touchPoint: touchPoint).cgPath
        animation.duration = 2
        animation.isRemovedOnCompletion = true
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        imageView.frame = CGRect(x: -40, y: 0, width: 40, height: 40)
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
            imageView.alpha = 0
        } completion: { _ in
            imageView.removeFromSuperview()
        }

    }
    
    func customVerticalPath(touchPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        
        let pathLength = 600
        let curveLength = pathLength / 4
        
        path.move(to: touchPoint)
        
        let endpoint = CGPoint(x: touchPoint.x, y: touchPoint.y - CGFloat(pathLength))
        
        let curve1 = CGPoint(x: touchPoint.x - 50, y: touchPoint.y - CGFloat(curveLength))
        let curve2 = CGPoint(x: touchPoint.x + 50, y: touchPoint.y - CGFloat(3 * curveLength))
        
        path.addCurve(to: endpoint, controlPoint1: curve1, controlPoint2: curve2)
        
        return path
    }
    
}//end of class
