//
//  KNN.swift
//  BuildAIFromScratch
//
//  Created by Ana Caroline Sampaio Nogueira on 09/05/23.
//  main.swift
import Foundation
struct KnnClassifier {
    func knn(trainingSet: [[Double]], testInstance: [Double], k: Int) -> (String, [Int]) {
        var distances = [(Int, Double)]()
        for i in 0..<trainingSet.count {
            let dist = euclideanDistance(data1: testInstance, data2: trainingSet[i], length: 4)
            distances.append((i, dist))
        }
        distances.sort { $0.1 < $1.1 }
        var neighbors = [Int]()
        for i in 0..<k {
            neighbors.append(distances[i].0)
        }
        var counts = [String : Int]()
        for neighbor in neighbors {
            var response: String
            switch trainingSet[neighbor].last! {
                case 1.0:
                    response = "setosa"
                case 2.0:
                    response = "versicolor"
                case 3.0:
                    response = "virginica"
                default:
                    fatalError()
            }
            if let count = counts[response] {
                counts[response] = count + 1
            } else {
                counts[response] = 1
            }
        }
        let sortedCounts = counts.sorted { $0.1 > $1.1 }
        let label = sortedCounts[0].key
        return (sortedCounts[0].key, neighbors)
    }
    func euclideanDistance(data1: [Double], data2: [Double], length: Int) -> Double {
        var distance = 0.0
        for i in 0..<length {
            distance += pow(data1[i] - data2[i], 2)
        }
        return sqrt(distance)
    }
}
var plants: [Iris] = []
//let simdArray = plants.map { SIMD4<Double>($0.sepalLengthCm, $0.sepalWidthCm, $0.petalLengthCm, $0.petalWidthCm) }
func readCSV() {
    let knnAlgorithm = KnnClassifier()
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
    let (result, neighbors) = knnAlgorithm.knn(trainingSet: irisArray, testInstance: testInstance, k: k)
    print("And the flower is: \(result)")
    print("The neighbors are: \(neighbors)")

}
