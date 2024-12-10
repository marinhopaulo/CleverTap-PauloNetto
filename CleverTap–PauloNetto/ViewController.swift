//
//  ViewController.swift
//  CleverTap–PauloNetto
//
//  Created by Paulo Netto on 09/12/24.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btn_ProductView(_ sender: Any) {
        // event with properties
        let props: [String: Any] = [
            "Product ID": 1,
            "Product name": "CleverTap",
            "Product Image": "https://d35fo82fjcw0y8.cloudfront.net/2018/07/26020307/customer-success-clevertap.jpg"
        ]

        CleverTap.sharedInstance()?.recordEvent("Product viewed", withProps: props)
        
        // creating a profile with "Email" as the identifier
        let profile: Dictionary<String, AnyObject> = [
            "Name": "Paulo Netto" as AnyObject,  // String
            "Email": "clevertap+paulo_marinho@gmail.com" as AnyObject, // Email address of the user. Will be used as identifier
            "MSG-push": true  as AnyObject, // Enable push notifications
        ]

        CleverTap.sharedInstance()?.onUserLogin(profile)
        let clevertapID = CleverTap.sharedInstance()?.profileGetID()
        print("CleverTap ID is: \(clevertapID)")
        
    }
}

