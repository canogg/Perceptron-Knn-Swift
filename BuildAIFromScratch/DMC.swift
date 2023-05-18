//
//  DMC.swift
//  BuildAIFromScratch
//
//  Created by Ana Caroline Sampaio Nogueira on 11/05/23.
//

import Foundation
// valor medio por atributo 4 medias de cada espécie
// 3 vetores
//

struct DmcClassifier {
    func traning() {

    }
    func predict() {

    }
}
var totalplants: [Iris] = []
//let simdArray = plants.map { SIMD4<Double>($0.sepalLengthCm, $0.sepalWidthCm, $0.petalLengthCm, $0.petalWidthCm) }
func readCSVIris() {
    let knnAlgorithm = DmcClassifier()
    guard let filePath = Bundle.main.path(forResource: "Iris", ofType: ".csv") else {
        return
    }
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return
    }
    var rows = data.components(separatedBy: "\n")
    rows.removeFirst()
    for row in rows {
        let columns = row.components(separatedBy: ",")
        if columns.count == 6 {
            let id = Int(columns[0]) ?? 0
            let sepalLengthCm = Double(columns[1]) ?? 0
            let sepalWidthCm = Double(columns[2]) ?? 0
            let petalLengthCm = Double(columns[3]) ?? 0
            let petalWidthCm = Double(columns[4]) ?? 0
            let species = columns[5]
            let iris = Iris(id: id, sepalLengthCm: sepalLengthCm, sepalWidthCm: sepalWidthCm, petalLengthCm: petalLengthCm, petalWidthCm: petalWidthCm, species: species)
            plants.append(iris)
        }
    }
    let testInstance = [5.0,3.3,1.4,0.2]
    let k = 4
    var irisArray: [[Double]] = []
    for plant in plants {
        irisArray.append([plant.petalLengthCm, plant.petalWidthCm, plant.sepalLengthCm, plant.sepalWidthCm])
    }
//    let (result, neighbors) = knnAlgorithm.knn(trainingSet: irisArray, testInstance: testInstance, k: k)
//    print("And the flower is: \(result)")
//    print("The neighbors are: \(neighbors)")

}

