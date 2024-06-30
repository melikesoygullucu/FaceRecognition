//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Melike Soygüllücü on 30.06.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signIn(_ sender: Any) {
        
        let authContex = LAContext()
        var error : NSError?
        
        if authContex.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContex.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To confirm it is you") { success, error in
                if success == true {
                    // it gives warning to running in main thread
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                    
                }
            }
        }
        
    }
    
}

