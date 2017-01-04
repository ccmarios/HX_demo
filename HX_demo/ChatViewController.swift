//
//  ChatViewController.swift
//  HX_demo
//
//  Created by XX on 17/1/3.
//  Copyright © 2017年 XX. All rights reserved.
//  聊天详情页

import UIKit

class ChatViewController: EaseMessageViewController, EaseMessageViewControllerDelegate, EaseMessageViewControllerDataSource {
    
    
    
    override init!(conversationChatter: String!, conversationType: EMConversationType) {
        super.init(conversationChatter: conversationChatter, conversationType: conversationType)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "聊天"
        self.delegate = self
        self.dataSource = self
    }
    
    // 点击头像回调
    func messageViewController(viewController: EaseMessageViewController!, didSelectAvatarMessageModel messageModel: IMessageModel!) {
        print("messageModel:\(messageModel.nickname)    message:\(messageModel.text)")
    }
    // 是否允许长按
    func messageViewController(viewController: EaseMessageViewController!, canLongPressRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }

}
