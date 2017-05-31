//
//  LoginController.swift
//  SmartHome
//
//  Created by khacpham on 5/30/17.
//  Copyright © 2017 oic.com. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
//import RxCocoa
import Alamofire

let displayWidth: CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
let displayHeight: CGFloat = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)

class LoginController : UIViewController {
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView(){
        self.view.backgroundColor = UIColor.white
        
        // popup bg
        let popupBg = UIView();
        popupBg.frame = CGRect(x: (displayWidth-270)/2, y: (displayHeight-200)/2, width: 270, height: 200)
        popupBg.backgroundColor = UIColor.init(red: 252.0/255, green: 252.0/255, blue: 252.0/255, alpha: 1)
        popupBg.layer.cornerRadius = 12
        popupBg.layer.masksToBounds = true
        
        view.addSubview(popupBg)
        
        // label Smart Home
        let lblTitle = UILabel()
        lblTitle.text = "SmartHome"
        lblTitle.textColor = UIColor.black
        lblTitle.font = lblTitle.font.withSize(17)
        lblTitle.sizeToFit()
        lblTitle.frame = CGRect(x: (270-lblTitle.frame.width)/2, y: 14, width: lblTitle.frame.width, height: lblTitle.frame.height)
        popupBg.addSubview(lblTitle)
        
        // textview username
        let tfUsername = UITextField()
        tfUsername.placeholder = "Username"
        tfUsername.frame = CGRect(x: 24, y: 60, width: 270 - 48, height: 20)
        tfUsername.backgroundColor = UIColor.white
        tfUsername.leftViewMode = .always
        tfUsername.rightViewMode = .always
        tfUsername.keyboardAppearance = .dark
        tfUsername.returnKeyType = .done
        
        let paddingView = UIView()
        paddingView.frame = CGRect(x: 0, y: 0, width: 16, height: 20)
        tfUsername.leftView = paddingView
        tfUsername.rightView = paddingView
        
        popupBg.addSubview(tfUsername)
        
        // textview password
        let tfPassword = UITextField()
        tfPassword.placeholder = "Password"
        tfPassword.frame = CGRect(x: 24, y: 100, width: 270 - 48, height: 20)
        tfPassword.backgroundColor = UIColor.white
        tfPassword.leftViewMode = .always
        tfPassword.rightViewMode = .always
        tfPassword.keyboardAppearance = .dark
        tfPassword.returnKeyType = .done
        tfPassword.isSecureTextEntry = true
        
        let paddingView2 = UIView()
        paddingView2.frame = CGRect(x: 0, y: 0, width: 16, height: 20)
        tfPassword.leftView = paddingView2
        tfPassword.rightView = paddingView2
        
        popupBg.addSubview(tfPassword)
        
        // login button
        let btnLogin = UIButton()
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.setTitleColor(UIColor.init(red: 0, green: 118/255, blue: 255/255, alpha: 1), for: .normal)
        btnLogin.frame = CGRect(x: (270-100)/2, y: 120, width: 100, height: 48)
        popupBg.addSubview(btnLogin)
        
        btnLogin.rx.tap.subscribe(onNext: { _ in
            let username = tfUsername.text
            let password = tfPassword.text
            
            Alamofire.request("https://google.com").responseJSON{ response in
                print(response.request)
            }
        }).addDisposableTo(disposeBag)
        
        // create new account text
        let lblCreateNewAccount = UILabel()
        lblCreateNewAccount.text = "Create new account"
        lblCreateNewAccount.textColor = UIColor.black
        lblCreateNewAccount.font = lblCreateNewAccount.font.withSize(11)
        lblCreateNewAccount.sizeToFit()
        lblCreateNewAccount.frame = CGRect(x: (270-lblCreateNewAccount.frame.width)/2, y: 160, width: lblCreateNewAccount.frame.width, height: 20)
        popupBg.addSubview(lblCreateNewAccount)
    }
}
