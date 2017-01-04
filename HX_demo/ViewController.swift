//
//  ViewController.swift
//  HX_demo
//
//  Created by XX on 16/12/29.
//  Copyright © 2016年 XX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var myLayout: UICollectionViewFlowLayout!
    
    let imageArray = ["kefu","chat","chat","chat"]
    let nameArray = ["客服","user1","user2","user3"]
    var converUser: String?
    
    var userTextField: UITextField?
    var passwordTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildCollectionView()
    }
    
    
    func buildCollectionView() {
        self.myLayout.minimumLineSpacing = 5
        self.myLayout.minimumInteritemSpacing = 5
        self.myLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12)
        self.myLayout.itemSize = CGSizeMake(100, 80)
        self.myCollectionView.collectionViewLayout = self.myLayout
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellID", forIndexPath: indexPath)
        (cell.viewWithTag(1) as! UIImageView).image = UIImage(named: self.imageArray[indexPath.item])
        (cell.viewWithTag(2) as! UILabel).text = self.nameArray[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.item {
        case 0:   //客服
            self.converUser =  "user001"
        case 1:   //用户1
            self.converUser =  "user002"
        case 2:   //用户2
            self.converUser =  "user003"
        case 3:   //用户3
            self.converUser =  "user004"
        default:
            break
        }
        
        let vc = ChatViewController.init(conversationChatter: self.converUser, conversationType: EMConversationTypeChat)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func buttonClick(sender: UIButton) {
        //tag---  3:登录    4:注册    5:退出登录
        switch sender.tag {
        case 3:
            let alertVC = UIAlertController(title: "登录", message: nil, preferredStyle: .Alert)
            alertVC.addTextFieldWithConfigurationHandler({ (textFielld1) in
                textFielld1.placeholder = "用户名"
                textFielld1.delegate = self
                self.userTextField = textFielld1
            })
            alertVC.addTextFieldWithConfigurationHandler({ (textFidld2) in
                textFidld2.placeholder = "密码"
                textFidld2.secureTextEntry = true
                textFidld2.delegate = self
                self.passwordTextField = textFidld2
            })
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (alert) in
                EMClient.sharedClient().loginWithUsername(self.userTextField?.text, password: self.passwordTextField?.text, completion: { (userName, error) in
                    if error == nil{
                        print("登录成功")
                    }else{
                        print("错误码:\(error.code)   错误描述:\(error.errorDescription)")
                    }
                })
            })
            let cancelAC = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertVC.addAction(okAction)
            alertVC.addAction(cancelAC)
            self.presentViewController(alertVC, animated: true, completion: nil)
        case 4:
            let alertVC = UIAlertController(title: "注册", message: nil, preferredStyle: .Alert)
            alertVC.addTextFieldWithConfigurationHandler({ (textFielld1) in
                textFielld1.placeholder = "用户名"
                textFielld1.delegate = self
                self.userTextField = textFielld1
            })
            alertVC.addTextFieldWithConfigurationHandler({ (textFidld2) in
                textFidld2.placeholder = "密码"
                textFidld2.secureTextEntry = true
                textFidld2.delegate = self
                self.passwordTextField = textFidld2
            })
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (alert) in
                EMClient.sharedClient().registerWithUsername(self.userTextField?.text, password: self.passwordTextField?.text, completion: { (userName, error) in
                    if error == nil{
                        print("注册成功")
                    }else{
                        print("错误码:\(error.code)   错误描述:\(error.errorDescription)")
                    }
                })
            })
            let cancelAC = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertVC.addAction(okAction)
            alertVC.addAction(cancelAC)
            self.presentViewController(alertVC, animated: true, completion: nil)
        case 5:
            EMClient.sharedClient().logout(true, completion: { (error) in
                if error == nil{
                    print("退出成功")
                }else{
                    print("错误码:\(error.code)   错误描述:\(error.errorDescription)")
                }
            })
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == self.userTextField {
            print("userTextField:\(self.userTextField?.text)")
            self.userTextField?.text = textField.text
        }else{
            self.passwordTextField?.text = textField.text
        }
    }

}

