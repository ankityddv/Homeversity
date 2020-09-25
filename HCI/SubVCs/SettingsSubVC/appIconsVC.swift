//
//  SettingsVC.swift
//  HCI
//
//  Created by Ankit on 19/09/20.
//

import UIKit

class appIconsVC: UIViewController {
    
    @IBOutlet weak var icon1: UIButton!
    @IBOutlet weak var icon2: UIButton!
    @IBOutlet weak var icon3: UIButton!
    

    // To add app icon
    let appIconService = AppIConService()
    
    @IBAction func didTapPrimaryIcon() {
        appIconService.changeAppIcon(to: .primaryAppIcon)
    }
    
    @IBAction func didTapNeonIcon() {
        appIconService.changeAppIcon(to: .neonAppIcon)
    }

    @IBAction func didTapDarkIcon()  {
        appIconService.changeAppIcon(to: .darkAppIcon)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icon1.imageView?.layer.cornerRadius = 20
        icon2.imageView?.layer.cornerRadius = 20
        icon3.imageView?.layer.cornerRadius = 20
    }

}
