//
//  ViewController.swift
//  exemplo-swift
//
//  Created by Maicon Borges on 24/03/15.
//  Copyright (c) 2015 Maicon Borges. All rights reserved.
//

import UIKit
import IJReachability

class ViewController: UIViewController {

    
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var lblTypeNetworking: UILabel!
    let transparentView = HATransparentView()
    let conexao = IJReachability.isConnectedToNetwork()
    let tipoConexao = IJReachability.isConnectedToNetworkOfType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println(tipoConexao)
        if conexao {
            self.lblNotification.text = "Conectado a Internet"
            
            switch tipoConexao {
                case .WWAN:
                    self.lblTypeNetworking.text = "3G"
                case .WiFi:
                    self.lblTypeNetworking.text = "WiFi"
                default:
                    self.lblTypeNetworking.text = "Do além"
            }
        } else {
            self.lblNotification.text = "Não conectado a Internet!!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openTransparentView(sender: UIButton) {
        
        transparentView.open()
        
    }

}

