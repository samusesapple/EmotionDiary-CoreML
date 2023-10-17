//
//  MLDataType.swift
//  EmotionDiary
//
//  Created by dev on 2023/10/17.
//

import Foundation
import CoreML
import TabularData

struct MLDataModel: Decodable {
    let detail: String
    let label: String
}


func printTrainingData() {
    let jsonURL = Bundle.main.url(forResource: "MLInputTextData", withExtension: "json")!
//    let jsonURLData = try! Data(contentsOf: jsonURL)
//    let jsonData = try! JSONSerialization.jsonObject(with: jsonURLData)
    
    do {
        let data = try DataFrame(contentsOfJSONFile: jsonURL)
        let (trainingData, testingData) = data.stratifiedSplit(on: "detail", by: 0.8)
        print("TRAINING DATA: \(trainingData)")
    } catch {
        print("에러: \(error)")
    }
}

