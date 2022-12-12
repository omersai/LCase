//
//  SplashViewController.swift
//  MoviesUI
//
//  Created by OMER on 10.12.2022.
//

import UIKit
import Alamofire
import FirebaseRemoteConfig

final class SplashViewController: UIViewController {
    
    @IBOutlet weak var logoText: UILabel!
    @IBOutlet weak var infoImg: UIImageView!
    @IBOutlet weak var infoText: UILabel!
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isConnected(){
            networkSetupUI()
            fetchValues()
        }
    }
    
    @objc func dismissSplash(){
        let viewController = MainBuilder.make()
        show(viewController, sender: nil)
    }
    
    func isConnected() -> Bool{
        return NetworkReachabilityManager()!.isReachable
    }
    
    func networkSetupUI(){
        infoImg.isHidden = true
        infoText.isHidden = true
    }
    
    func fetchValues(){
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil{
                self.remoteConfig.activate { status, error in
                    guard error == nil else{
                        return
                    }
                    
                    let value = self.remoteConfig.configValue(forKey: "logo").stringValue
                    DispatchQueue.main.async {
                        if let value = value{
                            self.logoText.text = value
                            Timer.scheduledTimer(timeInterval:3, target: self, selector: #selector(self.dismissSplash), userInfo: nil, repeats: false)
                        }
                    }
                }
            }
        }
    }
}
