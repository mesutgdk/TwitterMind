//
//  main.swift
//  TwitterMindMLMaker
//
//  Created by Mesut Gedik on 12.05.2023.
//

import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/mesutgdk/Desktop/CoreML/TweetMindMLMaker/twitter-sanders-apple3.csv"))

let (trainingData, testingData) = data.randomSplit(by: 0.8,seed: 5)

let mindClassifier = try MLTextClassifier(trainingData:trainingData , textColumn: "text", labelColumn: "class")

// MARK: - TEST

let evaluationMetrics = mindClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let evecuationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100


let metaData = MLModelMetadata(author: "Mesut Gedik", shortDescription: "A model trained to classify sntiment on Tweets", version: "1.0")

try mindClassifier.write(to: URL(fileURLWithPath: "/Users/mesutgdk/Desktop/CoreML/TweetMindMLMaker/TweetMindClassifier.mlmodel"))



