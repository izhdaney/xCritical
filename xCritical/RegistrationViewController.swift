//
//  RegistrationViewController.swift
//  xCritical
//
//  Created by Ilya Zhdaney on 14.07.2021.
//

import UIKit

class RegistrationViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var lblErrorName: UILabel!
    @IBOutlet weak var lblErrorLastName: UILabel!
    @IBOutlet weak var lblErrorEmail: UILabel!
    @IBOutlet weak var lblErrorPhone: UILabel!
    
    
    @IBOutlet weak var btnTerms: UIButton!
    @IBOutlet weak var btnChangeBroker: UIButton!
    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var switchTerms: UISwitch!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lineName: UIView!
    @IBOutlet weak var lineLastName: UIView!
    @IBOutlet weak var lineEmail: UIView!
    @IBOutlet weak var linePhone: UIView!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var txtPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initColor()
        initValues()
        initProperty()
        
        registerForeKeybordNotifications()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    deinit{
        removeKeyboardNotifications()
    }
    
    
    func initColor(){
        view.backgroundColor = UIColor(red: 0.016, green: 0.02, blue: 0.055, alpha: 1)
        
        lineName.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        lineLastName.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        lineEmail.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        linePhone.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 1)
        
        lblName.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        lblLastName.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        lblEmail.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        lblPhone.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        
        lblErrorName.textColor = UIColor(red: 1, green: 0.165, blue: 0.315, alpha: 1)
        lblErrorLastName.textColor = UIColor(red: 1, green: 0.165, blue: 0.315, alpha: 1)
        lblErrorEmail.textColor = UIColor(red: 1, green: 0.165, blue: 0.315, alpha: 1)
        lblErrorPhone.textColor = UIColor(red: 1, green: 0.165, blue: 0.315, alpha: 1)
        
        btnTerms.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: UIControl.State.normal)
        
        btnChangeBroker.setTitleColor(UIColor(red: 0.41, green: 0.483, blue: 0.867, alpha: 1), for: UIControl.State.normal)
        
        btnSignIn.layer.backgroundColor = UIColor(red: 0.102, green: 0.098, blue: 0.2, alpha: 1).cgColor
        
        btnSignUp.layer.backgroundColor = UIColor(red: 0.41, green: 0.483, blue: 0.867, alpha: 1).cgColor
        
        btnSignIn.setTitleColor(.white, for: .normal)
        
        btnSignUp.setTitleColor(.white, for: .normal)
        
        txtName.textColor = .white
        txtLastName.textColor = .white
        txtEmail.textColor = .white
        txtPhone.textColor  = .white
    }
    
    func initValues(){
        lblName.text = "Имя"
        lblLastName.text = "Фамилия"
        lblEmail.text = "E-mail"
        lblPhone.text = "Телефон"
        lblTerms.text = "Я принимаю"
        lblErrorName.text = "Обязательное поле"
        lblErrorLastName.text = "Обязательное поле"
        lblErrorEmail.text = "Некорректный e-mail"
        lblErrorPhone.text = "Некорректный номер телефона"
        
        
        let termsAttributedString = NSMutableAttributedString()
                termsAttributedString.append(NSAttributedString(string: "пользовательское соглашение", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]))
                btnTerms.setAttributedTitle(termsAttributedString, for: .normal)
        
        let brokerAttributedString = NSMutableAttributedString()
                brokerAttributedString.append(NSAttributedString(string: "Сменить брокера", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]))
                btnChangeBroker.setAttributedTitle(brokerAttributedString, for: .normal)
        
        
        txtName.attributedPlaceholder = NSAttributedString(string: "Ваше имя", attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 0.6)])
        
        txtLastName.attributedPlaceholder = NSAttributedString(string: "Ваша фамилиия", attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 0.6)])
        
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Введите email", attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 0.6)])
        
        txtPhone.attributedPlaceholder = NSAttributedString(string: "+71234567890", attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.45, green: 0.45, blue: 0.642, alpha: 0.6)])
        
        btnSignIn.setTitle("Войти", for: .normal)
        btnSignUp.setTitle("Зарегистрироваться", for: .normal)
        
//        imgCheckOn.tintColor = UIColor(red: 0.41, green: 0.483, blue: 0.867, alpha: 1)
//        imgCheckOff.tintColor = UIColor(red: 0.41, green: 0.483, blue: 0.867, alpha: 1)
        
        switchTerms.onTintColor = UIColor(red: 0.41, green: 0.483, blue: 0.867, alpha: 1)
        

    }
    
    func initProperty(){
        btnSignIn.layer.cornerRadius = 12
        btnSignUp.layer.cornerRadius = 12
        imgFlag.layer.cornerRadius = 7
        
        lblErrorName.isHidden = true
        lblErrorLastName.isHidden = true
        lblErrorEmail.isHidden = true
        lblErrorPhone.isHidden = true
        switchTerms.isOn = false
    }
    
    @IBAction func tapScreen(_ sender: Any) {
        txtName.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtPhone.resignFirstResponder()
        txtLastName.resignFirstResponder()
        self.scrollView.isScrollEnabled = false
    }

    @IBAction func txtNameScroll(_ sender: Any) {
//        DispatchQueue.main.async {
//            UIView.animate(withDuration: 0.15, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
//                self.scrollView.contentOffset.y = self.txtName.frame.maxY - (self.scrollView.frame.maxY / 2 - 30)
//               }, completion: nil)
//        }
    }
    @IBAction func txtLastNameScroll(_ sender: Any) {
//        DispatchQueue.main.async {
//            UIView.animate(withDuration: 0.15, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
//                self.scrollView.contentOffset.y = self.txtLastName.frame.maxY - (self.scrollView.frame.maxY / 2 - 30)
//               }, completion: nil)
//        }
    }
    
    @IBAction func txtEmailScroll(_ sender: Any) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.15, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.y = self.txtEmail.frame.maxY - (self.scrollView.frame.maxY / 2 - 30)
               }, completion: nil)
        }
    }
    
    
    @IBAction func txtPhoneScroll(_ sender: Any) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.15, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.y = self.txtPhone.frame.maxY - (self.scrollView.frame.maxY / 2 - 30)
               }, completion: nil)
        }
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtName.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtPhone.resignFirstResponder()
        txtLastName.resignFirstResponder()
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == txtName {
//           txtName.resignFirstResponder()
//           txtLastName.becomeFirstResponder()
//        } else if textField == txtLastName {
//           txtLastName.resignFirstResponder()
//           txtEmail.becomeFirstResponder()
//        } else if textField == txtEmail {
//           txtEmail.resignFirstResponder()
//            txtPhone.becomeFirstResponder()
//        }
//        else if textField == txtPhone{
//            txtPhone.resignFirstResponder()
//        }
//       return true
//      }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField {
//        case txtName:
//            txtLastName.becomeFirstResponder()
//        case txtLastName:
//            txtEmail.becomeFirstResponder()
//        case txtEmail:
//            txtPhone.becomeFirstResponder()
//        default:
//            textField.resignFirstResponder()
//        }
//        return false
//    }
    
    
    func registerForeKeybordNotifications(){

        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    func removeKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self , name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self , name: UIResponder.keyboardWillShowNotification, object: nil)
    }


        @objc func kbWillShow(_ notification: Notification){

            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let keyboardRectangle = keyboardFrame.cgRectValue
                    let keyboardHeight = keyboardRectangle.height
//                    scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight)
                
                scrollView.isScrollEnabled = true
                let insent = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
                scrollView.scrollIndicatorInsets = insent
                scrollView.contentInset = insent
            }
        }

        @objc func kbWillHide(){
            scrollView.contentOffset = CGPoint.zero
        }
}
