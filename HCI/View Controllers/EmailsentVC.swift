//
//  EmailsentVC.swift
//  HCI
//
//  Created by Ankit on 10/10/20.
//

import UIKit

class EmailsentVC: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var gifView: UIImageView!
    
    @IBAction func openMailApptapped(_ sender: Any) {
        let mailURL = URL(string: "message://")!
           if UIApplication.shared.canOpenURL(mailURL) {
               UIApplication.shared.open(mailURL, options: [:], completionHandler: nil)
            }
    }
    @IBAction func confirmLatertapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "verified")
        cardView.layer.cornerRadius = 20
        
    }

}
