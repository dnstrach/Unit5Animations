//
//  LoginViewController.swift
//  Animations
//
//  Created by Dominique Strachan on 2/5/23.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var faqButton: UIButton!
    @IBOutlet weak var confirmSignupButton: UIButton!
    
    //MARK: - Properties
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    //MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: Any) {
        toggleToLogin()
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        toggleToSignup()
    }
    
    @IBAction func confirmSignupButtonTapped(_ sender: Any) {
        presentCardVC()
    }
    
    //MARK: Helpers
    func setUpViews() {
        confirmSignupButton.layer.cornerRadius = 20.0
        signUpButton.rotate()
        loginButton.rotate()
    }
    
    func toggleToLogin() {
        UIView.animate(withDuration: 0.3) {
            self.confirmPasswordTextField.isHidden = true
            self.loginButton.alpha = 1.0
            self.signUpButton.alpha = 0.3
            self.confirmSignupButton.setTitle("Log me in!", for: .normal)
            self.helpButton.setTitle("Forgot?", for: .normal)
            self.faqButton.setTitle("Hint", for: .normal)
        }
    }
    
    func toggleToSignup() {
        UIView.animate(withDuration: 0.3) {
            self.confirmPasswordTextField.isHidden = false
            self.loginButton.alpha = 0.3
            self.signUpButton.alpha = 1.0
            self.confirmSignupButton.setTitle("Sign me up!", for: .normal)
            self.helpButton.setTitle("Help", for: .normal)
            self.faqButton.setTitle("FAQ", for: .normal)
        }
    }
    
    func presentCardVC() {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let cardVC = main.instantiateViewController(withIdentifier: "cardVC")
        cardVC.modalPresentationStyle = .fullScreen
        self.present(cardVC, animated: true)
    }
    
}//end of class

extension UIView {
    func rotate(by radians: CGFloat = (-CGFloat.pi/2)) {
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}//end of extension
