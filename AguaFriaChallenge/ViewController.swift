//
//  ViewController.swift
//  AguaFriaChallenge
//
//  Created by Palloma Ramos on 17/08/20.
//  Copyright © 2020 Palloma Ramos. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    //    let date: Date
}

class ViewController: UITableViewController {
    
    fileprivate let cellID = "id"
    
    let chatMessages = [
        [
            ChatMessage(text: "Salut Palloma, comment vas-tu?", isIncoming: true),
            ChatMessage(text: "Salut mon amie, je vais bien et toi?", isIncoming: false),
            ChatMessage(text: "Moi aussi", isIncoming: true),
            ChatMessage(text: "La semaine prochaine est votre anniversaire, non?", isIncoming: true),
            ChatMessage(text: "Oui :)", isIncoming: false),
            ChatMessage(text: "Tu viens manger du gâteau?", isIncoming: false),
            ChatMessage(text: "Bien sûr!", isIncoming: true),
            ChatMessage(text: "Super", isIncoming: false),
        ],
        [
            ChatMessage(text: "hey", isIncoming: false),
            ChatMessage(text: "hey", isIncoming: false),
            ChatMessage(text: "hey", isIncoming: false),
            ChatMessage(text: "ça va?", isIncoming: true),
            ChatMessage(text: "ça va. Pouvez-vous apporter un coca?", isIncoming: false),
            ChatMessage(text: "bien sûr que oui", isIncoming: true),
            ChatMessage(text: "merci", isIncoming: false),
            
        ]
        
        
    ]
    
    //    let chatMessages = [
    //        [
    //        ChatMessage(text: "Salut Palloma, comment tu vas?", isIncoming: true, date: Date() ),
    //         ChatMessage(text: "Salut mon amie, je vais bien et toi?", isIncoming: false, date: Date()),
    //         ChatMessage(text: "Moi aussi", isIncoming: true, date: Date()),
    //         ChatMessage(text: "La semaine prochaine est votre anniversaire, non?", isIncoming: true, date: Date()),
    //         ChatMessage(text: "Oui :)", isIncoming: false, date: Date()),
    //         ChatMessage(text: "Tu viens manger du gâteau?", isIncoming: false, date: Date()),
    //         ChatMessage(text: "Bien sûr!", isIncoming: true, date: Date()),
    //         ChatMessage(text: "Super", isIncoming: false, date: Date())
    //        ],
    //        [
    //            ChatMessage(text: "hey", isIncoming: false, date: Date()),
    //            ChatMessage(text: "hey", isIncoming: false, date: Date()),
    //            ChatMessage(text: "hey", isIncoming: false, date: Date()),
    //            ChatMessage(text: "ça va?", isIncoming: true, date: Date()),
    //            ChatMessage(text: "ça va. Pouvez-vous apporter un coca?", isIncoming: false, date: Date()),
    //            ChatMessage(text: "bien sûr que oui", isIncoming: true, date: Date()),
    //            ChatMessage(text: "merci", isIncoming: false, date: Date())
    //        ]
    //    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(MessageChatCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none //Tira as linhas da TableView
        //        tableView.backgroundColor = #colorLiteral(red: 0.9070621133, green: 0.9016702771, blue: 0.9112069607, alpha: 1)
        let photo =  UIImage(named: "photo")
        
        //        self.tableView.backgroundColor = UIColor(patternImage: photo!)
        self.tableView.backgroundView = UIImageView(image: photo!)
        let image = UIImageView(image: photo)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        //        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        //        backgroundImage.image = UIImage(named: "photo")
        //        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        //        self.tableView.insertSubview(backgroundImage, at: 30)
        
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)! as! MessageChatCell
        //        cell.textLabel?.text = "Salut Je m'apelle Palloma, je suis dix neuf ans et je suis brasilienne. Je suis on travaille."
        //        cell.textLabel?.numberOfLines = 0 //faz com que o texto não fique cortado
        
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        //        cell.messageLabel.text = chatMessage.text
        //        cell.isIncoming = indexPath.row % 2 == 0
        cell.chatMessage = chatMessage
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeader: UILabel {
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height/2.5
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 16, height: originalContentSize.height + 12)
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = DateHeader()
        label.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        label.text = "21/08"
        label.textColor = .black
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false // enables auto layout
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        let containerView = UIView()
        containerView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        label.layer.cornerRadius = 7
        
        return containerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        if chatMessages[section].first != nil {
    //            return "20/08"
    //        }
    //
    //        return "\(Date())"
    //    }
    
}


