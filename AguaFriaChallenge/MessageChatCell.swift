//
//  MessageChatCell.swift
//  AguaFriaChallenge
//
//  Created by Palloma Ramos on 18/08/20.
//  Copyright © 2020 Palloma Ramos. All rights reserved.
//

import UIKit

class MessageChatCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let backView = UIView()
    var leftConstraint: NSLayoutConstraint!
    var rightConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage!{
        didSet{
            backView.backgroundColor = chatMessage.isIncoming ? .white : #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming{
                leftConstraint.isActive = true
                rightConstraint.isActive = false
            }
            else {
                leftConstraint.isActive = false
                rightConstraint.isActive = true
            }
        }
    }
    
    //    var isIncoming: Bool! {
    //        didSet{
    //            backView.backgroundColor = isIncoming ?.white : #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    //        }
    //    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        backView.backgroundColor = .yellow
        backView.layer.cornerRadius = 12
        backView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backView)
        
        addSubview(messageLabel)
        
        //        messageLabel.backgroundColor = .green
        messageLabel.text = "Salut Je m'apelle Palloma, je suis dix neuf ans et je suis brasilienne"
        
        messageLabel.numberOfLines = 0
        //                messageLabel.frame = CGRect(x: 50, y: 0, width: 100, height: 50)
        // devemos usar constraints
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints =
            [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
             messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
             messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
             backView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
             backView.leftAnchor.constraint(equalTo: messageLabel.leftAnchor, constant: -16),
             backView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
             backView.rightAnchor.constraint(equalTo: messageLabel.rightAnchor, constant: 16)
        ]
        
        
        // Ordem das constraints: Top, Left, Bottom, Right
        // constant: 16 dá um espaço entre as celulas
        
        NSLayoutConstraint.activate(constraints)
        
        leftConstraint = messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32)
        leftConstraint.isActive = false
        
        rightConstraint = messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32)
        rightConstraint.isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
}
