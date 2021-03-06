//
//  LogInVC.swift
//  HCI
//
//  Created by Ankit on 25/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit
import FirebaseAuth

class LogInVC: UIViewController {

    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var forgotPasswordBttn: UIButton!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var cardView: ShadowView!
    
    @IBAction func continueBttnPressed(_ sender: Any) {
        loginUser()
        //Heptic touch feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        let resetVC =  self.storyboard!.instantiateViewController(withIdentifier: "ResetVC") as! ResetVC
        self.present(resetVC, animated: true, completion: nil)
    }
    @IBAction func signUpTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tncTapped(_ sender: Any) {
        let tncVC =  self.storyboard!.instantiateViewController(withIdentifier: "tncVC") as! tncVC
        self.present(tncVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    //MARK-
    func loginUser() {
        let email = emailField.text!
        let password = passwordField.text!
            
        if email.count == 0 && password.count == 0 {
            let alert = UIAlertController(title: "Invalid!!!", message: "Please enter the email and password!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil{
                    let homeVC =  self.storyboard!.instantiateViewController(withIdentifier: "tab_bar") as! BubbleTabBarController
                    self.present(homeVC, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    self.stoploader()
                }
            }
            startloader()
        }
    }
    
    //MARK:- Start and stop custom activity indicator
    func startloader(){
        CustomLoader.instance.gifName = "giphy"
        CustomLoader.instance.showLoaderView()
    }
    
    func stoploader(){
        CustomLoader.instance.hideLoaderView()
    }
    
    // MARK: - Code below this is for hiding keyboard
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func hideKeyboard(){
        view.resignFirstResponder()
    }
    
    @objc func keyboardwilchange(notification: Notification){
        // when textfield pressed
        labelView.isHidden = true
        cardView.frame.origin.y = 60
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // when textfield rests
        labelView.isHidden = false
        cardView.frame.origin.y = 269
    }
    
}
