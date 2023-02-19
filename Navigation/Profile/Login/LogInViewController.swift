//
//  LogInViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 04.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 800)
        return view
    }()
    
    let logoView:UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: getStrings(stringsEnum: .iconLogo))
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.backgroundColor = .systemGray6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let loginEnterView: UITextField = {
        let view = UITextField(frame: .zero)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.textContentType = .username
        view.keyboardType = .emailAddress
        view.placeholder = getStrings(stringsEnum: .placeholderLogin)
        view.contentHorizontalAlignment = .fill
        view.autocapitalizationType = .none
        return view
    }()
    
    let delimeter: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let passwordEnterView: UITextField = {
        let view = UITextField(frame: .zero)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.placeholder = getStrings(stringsEnum: .placeholderPassw)
        view.isSecureTextEntry = true
        view.textContentType = .password
        view.autocapitalizationType = .none
        return view
    }()
    
    
    let logInButtonView: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle(getStrings(stringsEnum: .loginButtonText), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: getStrings(stringsEnum: .loginButtonColor)), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
        switch button.state{
        case .normal: button.alpha = 1
        case .selected: button.alpha = 0.8
        case .highlighted: button.alpha = 0.8
        case .disabled: button.alpha = 0.8
        default: button.alpha = 1
        }
        return button
        
    }()
    let promptPW: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .systemRed
        view.text = getStrings(stringsEnum: .prompt)
        view.font = UIFont.systemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize11)), weight: .regular)
        view.isHidden = true
        view.lineBreakMode = .byClipping
        view.numberOfLines = 2
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.scrollView.keyboardDismissMode = .interactive
        self.loginEnterView.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        self.passwordEnterView.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        self.passwordEnterView.addTarget(self, action: #selector(checkLength(_:)), for: .editingChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.isNavigationBarHidden = true
        subscrabeKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        let safeLayout = self.view.safeAreaLayoutGuide
        addAllSubwiew()
        setupAllView(safeLayout)
        pressButtons()
    }
    
    private func checkPasswordLength(_ passwordText: String) -> Bool{
        let count = passwordText.count
        return  count > 3
        
    }
    
    @objc func checkLength(_ textField: UITextField) {
        
        let text: String = textField.text ?? ""
        if checkPasswordLength(text){
            promptPW.isHidden = true
        } else {
            promptPW.isHidden = false
        }
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        self.stackView.layer.borderColor = UIColor.lightGray.cgColor
        self.stackView.backgroundColor = .systemGray6
    }
    
    
    @objc private func pressLogIn(){
        
        
        if self.loginEnterView.text == "" || self.passwordEnterView.text == ""{
            self.stackView.layer.borderColor = UIColor.systemRed.cgColor
            
            self.stackView.shakeLoginPassword()
        }
        else {
            if checkPasswordLength(passwordEnterView.text ?? ""){
                let login = loginEnterView.text ?? ""
                let password = passwordEnterView.text ?? ""
                
                let isValidLogin = loginEnterView.text?.checkValidEmail() ?? false
                print(isValidLogin)
                if !isValidLogin{
                    self.stackView.shakeLoginPassword()
                }
                if login == defaultAuthorization.login && password == defaultAuthorization.password{
                    let profileViewController = ProfileViewController()
                    self.navigationController?.pushViewController(profileViewController, animated: true)
                } else{
                    let alert = UIAlertController(title: getStrings(stringsEnum: .wrongLoginPassw), message: getStrings(stringsEnum: .needToCheckLP), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString(getStrings(stringsEnum: .ok), comment: getStrings(stringsEnum: .defaultActionComment)), style: .default, handler: { _ in
                        NSLog(getStrings(stringsEnum: .logAllert))
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                promptPW.isHidden = false
            }
            
        }
        
    }
    
    
    
}

extension LogInViewController{
    
    private func addAllSubwiew(){
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(self.logoView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(loginEnterView)
        stackView.addArrangedSubview(delimeter)
        stackView.addArrangedSubview(passwordEnterView)
        scrollView.addSubview(promptPW)
        scrollView.addSubview(self.logInButtonView)
    }
    
    private func setupAllView(_ safeLayout:UILayoutGuide){
        NSLayoutConstraint.activate([
            self.scrollView.heightAnchor.constraint(equalTo: safeLayout.heightAnchor, constant: 0),
            self.scrollView.widthAnchor.constraint(equalTo: safeLayout.widthAnchor, constant: 0),
            self.scrollView.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor, constant: 0),
            self.scrollView.centerYAnchor.constraint(equalTo: safeLayout.centerYAnchor, constant: 0),
            
            self.logoView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            self.logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoView.heightAnchor.constraint(equalToConstant: 100),
            self.logoView.widthAnchor.constraint(equalToConstant: 100),
            
            self.stackView.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 120),
            self.stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            self.loginEnterView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 5),
            self.loginEnterView.heightAnchor.constraint(equalToConstant: 50),
            self.loginEnterView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -5),
            
            self.delimeter.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            self.delimeter.heightAnchor.constraint(equalToConstant: 0.5),
            self.delimeter.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            self.passwordEnterView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 5),
            self.passwordEnterView.heightAnchor.constraint(equalToConstant: 50),
            self.passwordEnterView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -5),
            
            self.promptPW.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            self.promptPW.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            self.promptPW.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            
            
            self.logInButtonView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            self.logInButtonView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.logInButtonView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.logInButtonView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func pressButtons(){
        logInButtonView.addTarget(self, action: #selector(pressLogIn), for: .touchUpInside)
    }
    
    func subscrabeKeyboardEvents(){
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func KeyboardWillShow(_ notification: NSNotification){
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification){
        self.scrollView.contentInset = .zero
    }
    
    
}
extension UIStackView{
    func shakeLoginPassword(){
        let shakeAnimation = CABasicAnimation(keyPath: getStrings(stringsEnum: .keyPath))
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 4
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = CGPoint(x: self.center.x - 4, y: self.center.y)
        shakeAnimation.toValue = CGPoint(x: self.center.x + 4, y: self.center.y)
        layer.add(shakeAnimation, forKey: getStrings(stringsEnum: .keyPath))
    }
}
extension String{
    
    func substring(string: String, fromIndex: Int, toIndex: Int) -> String? {
        if fromIndex < toIndex && toIndex < string.count{
            let startIndex = string.index(string.startIndex, offsetBy: fromIndex)
            let endIndex = string.index(string.startIndex, offsetBy: toIndex)
            return String(string[startIndex..<endIndex])
        }else{
            return nil
        }
    }
    
    func checkValidEmail() -> Bool{
        guard !self.isEmpty else{
            return false
        }
        
        var state = 0
        var ch: Character
        var idx = 0
        var mark = 0
        var local: String? = nil
        var domain = [String]()
        
        while idx <= self.count && state != -1{
            if idx == self.count{
                ch = "\0"
            }else{
                ch = self[self.index(self.startIndex, offsetBy: idx)]
                if ch == "\0" {
                    return false
                }
            }
            switch state {
                
            case 0:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-"
                    || ch == "+") {
                    state = 1
                    break
                }
                state = -1
                
            case 1:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")
                    || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-"
                    || ch == "+") {
                    break
                }
                if ch == "." {
                    state = 2
                    break
                }
                if ch == "@" {
                    local = substring(string: self, fromIndex: 0, toIndex: idx - mark)
                    mark = idx + 1
                    state = 3
                    break
                }
                state = -1
                
            case 2:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")
                    || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-"
                    || ch == "+") {
                    state = 1
                    break
                }
                state = -1
                
            case 3:
                if ((ch >= "a" && ch <= "z") || (ch >= "0" && ch <= "9")
                    || (ch >= "A" && ch <= "Z")) {
                    state = 4
                    break
                }
                state = -1
                
            case 4:
                if ((ch >= "a" && ch <= "z") || (ch >= "0" && ch <= "9")
                    || (ch >= "A" && ch <= "Z")) {
                    break
                }
                if (ch == "-") {
                    state = 5
                    break
                }
                if (ch == ".") {
                    domain.append(substring(string: self, fromIndex: mark, toIndex: idx) ?? "")
                    mark = idx + 1;
                    state = 5
                    break
                }
                if (ch == "\0") {
                    domain.append(substring(string: self, fromIndex: mark, toIndex: idx) ?? "")
                    state = 6
                    break
                }
            case 5:
                if ((ch >= "a" && ch <= "z") || (ch >= "0" && ch <= "9")
                    || (ch >= "A" && ch <= "Z")) {
                    state = 4
                    break
                }
                if (ch == ".") {
                    break
                }
                state = -1
                
            case 6:
                break
            default:
                break
            }
            idx += 1
        }
        
        if state != 6 {
            return false
        }
        if (domain.count < 2){
            return false
        }
        
        if (local?.count ?? 0 > 64){
            return false
        }
        
        if (self.count > 254){
            return false
        }
        
        idx = self.count - 1;
        while idx > 0{
            ch = self[self.index(self.startIndex, offsetBy: idx)];
            if ch == "." && self.count - idx > 2 {
                return true
            }
            if !((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")){
                return false
            }
            idx -= 1
        }
        
        return true
    }
    
}
