//
//  ViewController.swift
//  TwitterMind
//
//  Created by Mesut Gedik on 12.05.2023.
//

import UIKit
import SwifteriOS
import CoreML

class ViewController: UIViewController {

    @IBOutlet weak var backgroundViev: UIView!
    @IBOutlet weak var faceLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let sentimentClassifier = TweetMindClassifier()
    
    let swifter = Swifter(consumerKey: "Your App Key here", consumerSecret: "Your App Secret Here")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prediction = try! sentimentClassifier.prediction(text: "@Apple is a terrible compony")
        
        print(prediction.label)
        
        swifter.searchTweet(using: "@Apple", lang:"en", count:100, tweetMode: .extended ,success: { (results, searchMetadata) in
            print(results)
        }, failure: {error in
            print("there is an error with Twitter API Request, \(error)")
        })
    }

    @IBAction func showThought(_ sender: UIButton) {
    }
    
}

