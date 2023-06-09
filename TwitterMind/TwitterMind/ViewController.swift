//
//  ViewController.swift
//  TwitterMind
//
//  Created by Mesut Gedik on 12.05.2023.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var backgroundViev: UIView!
    @IBOutlet weak var faceLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let sentimentClassifier = TweetMindClassifier()
    
    let swifter = Swifter(consumerKey: "Your App Key here", consumerSecret: "Your App Secret Here")
    
    let tweetNumber = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func showThought(_ sender: UIButton) {
        
        fetchTweet()
       
    }
    
    func fetchTweet(){
        if let searchText = textField.text {
            
            let prediction = try! sentimentClassifier.prediction(text: "@Apple is a terrible compony")
            
            //            print(prediction.label)
            
            swifter.searchTweet(using: searchText, lang:"en", count:tweetNumber, tweetMode: .extended ,success: { (results, searchMetadata) in
                //            print(results)
                
                var tweets = [TweetMindClassifierInput] ()
                for i in 0..<self.tweetNumber {
                    // results'un ilk elemanından full texti swiftyJSON ile çekiyoruz, if let for optional string
                    if let tweet = results[i]["full_text"].string {
                        //                    print(tweet)
                        let tweetForSentimentClassifierInput = TweetMindClassifierInput(text: tweet)
                        tweets.append(tweetForSentimentClassifierInput)
                    }
                }
                
                self.makePrediction(with: tweets)
                
            }, failure: {error in
                print("there is an error with Twitter API Request, \(error)")
            })
        }
    }
    
    func makePrediction(with tweets: [TweetMindClassifierInput]){
        do {
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            
                var emotionScore = 0
            
                for predict in predictions {
//                    print(predict.label)
                let emotion = predict.label
            
                if emotion == "Pos"{
                emotionScore += 1
                }else if emotion == "Neg" {
                emotionScore -= 1
                }
            }
            
            updateUI(with: emotionScore)
            
        }catch {
            print("There is an error with Twitter Api, \(error)")
        }
    }
    
    func updateUI(with emotionScore: Int){

        if emotionScore > 20 {
        self.faceLabel.text = "🥰"
        } else if emotionScore > 10 {
        self.faceLabel.text = "☺️"
        }else if emotionScore > 0 {
        self.faceLabel.text = "🙂"
        } else if emotionScore == 0{
        self.faceLabel.text = "😐"
        }else if emotionScore > -10 {
        self.faceLabel.text = "🙁"
        } else if emotionScore > -20{
        self.faceLabel.text = "😡"
        } else {
        self.faceLabel.text = "🤬"
        }
        
    }
}

