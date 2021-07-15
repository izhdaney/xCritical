//
//  LoginViewController.swift
//  xCritical
//
//  Created by Ilya Zhdaney on 07.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email: String = ""
    var pass: String = ""
    
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnChangeBroker: UIButton!
    @IBOutlet weak var emailLine: UIView!
    @IBOutlet weak var passLine: UIView!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var lblPassError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initValues()
        initColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func initValues(){
        
        
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Введите email", attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 0.6)])

        txtPassword.attributedPlaceholder = NSAttributedString(string: "Введите пароль", attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 0.6)])
        
        let passwordAttributedString = NSMutableAttributedString()
        passwordAttributedString.append(NSAttributedString(string: "Забыли пароль", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]))
                btnForgotPassword.setAttributedTitle(passwordAttributedString, for: .normal)
        
        let brokerAttributedString = NSMutableAttributedString()
                brokerAttributedString.append(NSAttributedString(string: "Сменить брокера", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]))
                btnChangeBroker.setAttributedTitle(brokerAttributedString, for: .normal)
        
        
        btnSignIn.layer.cornerRadius = 12
        btnSignUp.layer.cornerRadius = 12
        
        lblPassError.text = "Неверный пароль"
        lblEmailError.text = "Неверный e-mail"
        
        lblPassError.isHidden = true
        lblEmailError.isHidden = true
        
        
    }
    
    func initColor(){
        view.backgroundColor = UIColor(red: 0.016, green: 0.02, blue: 0.055, alpha: 1)
        lblEmail.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        lblPassword.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        txtEmail.textColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        txtPassword.textColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        emailLine.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        passLine.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        lblPassError.textColor = UIColor(red: 1, green: 0.165, blue: 0.315, alpha: 1)
        lblEmailError.textColor = UIColor(red: 1, green: 0.165, blue: 0.315, alpha: 1)
        btnForgotPassword.setTitleColor(UIColor(red: 0.41, green: 0.483, blue: 0.867, alpha: 1), for: UIControl.State.normal)
        
        btnChangeBroker.setTitleColor(UIColor(red: 0.41, green: 0.483, blue: 0.867, alpha: 1), for: UIControl.State.normal)
        
        
    }
    
    func validation(validationString: String) -> Bool{
        var validationResult: Bool = false
        
        if (validationString == ""){
            validationResult = false
            
        }
        else{
            validationResult = true
        }
        
        return validationResult
    }
    
    private func login() {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    @IBAction func btnSignInClick(_ sender: UIButton) {
        
        lblEmailError.isHidden = validation(validationString: email)
        lblPassError.isHidden = validation(validationString: pass)
        
        if (lblEmailError.isHidden && lblPassError.isHidden){
            login()
        }
        
    }
    
    
    @IBAction func txtEmailEdit(_ sender: UITextField) {
        
        email = String(txtEmail.text!)
        
        if (validation(validationString: email)){
            lblEmailError.isHidden = true
            
        }
        else{
            lblEmailError.isHidden = false
        }
        
    }
    
    
    @IBAction func txtPassEdit(_ sender: UITextField) {
        pass = String(txtPassword.text!)
        
        if (validation(validationString: pass)){
            lblPassError.isHidden = true
            
        }
        else{
            lblPassError.isHidden = false
        }
    }
    
    
    @IBAction func btnRegistration(_ sender: UIButton) {
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
}
