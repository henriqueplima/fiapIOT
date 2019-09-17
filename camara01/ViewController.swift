//
//  ViewController.swift
//  camara01
//
//  Created by Usuário Convidado on 16/09/19.
//  Copyright © 2019 Usuário Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperaturaLabel: UILabel!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
     self.chagartemp()
       
//        FirebaseConnector.teste()
        // Do any additional setup after loading the view.
    }
    
    @objc func chagartemp() {
        FirebaseConnector.fetchTemperature(sucess: { (temperatura) in
            DispatchQueue.main.async {
                self.temperaturaLabel.text = "\(temperatura) Celsus"
            }
            
        }) { (erro) in
            self.temperaturaLabel.text = erro
        }
    }


}

