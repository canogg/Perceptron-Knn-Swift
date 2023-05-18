//
//  Perceptron.swift
//  BuildAIFromScratch
//
//  Created by Ana Caroline Sampaio Nogueira on 11/05/23.
//

import Foundation

public struct Perceptron {

    // Definindo as entradas e saídas esperadas
    // *Generalizar o código

    let inputs = [[-1.0, 0.0, 0.0], [-1.0, 0.0, 0.1], [-1.0, 0.0, 1.0], [-1.0 , 1.0, 0.0], [-1.0 , 1.0, 1.0]]
    let labels = [0.0, 0.0, 1.0, 1.0, 1.0]

    // Definindo o learning rate (taxa de aprendizado)
    let learningRate = 0.1
    // Definindo os pesos iniciais aleatórios
    var weights = [Double.random(in: -1...1), Double.random(in: -1...1), Double.random(in: -1...1)]

    // Definindo a função de ativação (sigmoid)
    func degrau(_ u: Double) -> Double {
        return (u >= 0 ? 1 : 0)
    }

    // Loop de treinamento
    mutating func loopTraning() {
        for _ in 1...10000 {
            // Inicializando o erro como zero
            var error_acumulado = 0.0
            // Para cada entrada e saída esperada
            for i in 0..<inputs.count {
                let input = inputs[i]
                let label = labels[i]
                // Calculando a saída atual (y)
                let weightedSum = input[0] * weights[0] + input[1] * weights[1] + input[2] * weights[2]
                let output = degrau(weightedSum)
                // Calculando o erro
                let error = label - output
                // Atualizando os pesos
                weights[0] += learningRate * error * input[0]
                weights[1] += learningRate * error * input[1]
                weights[2] += learningRate * error * input[2]
                // Atualizando o erro total
                error_acumulado += abs(error)
            }
            // Verificando se o erro total está abaixo de um certo limite
            if error_acumulado <= 0.00001 {
                break
            }
        }
        // Imprimindo os pesos finais
        print("Pesos finais: \(weights)")
        //*Criar uma função
        // Verificando a saída para uma nova entrada
        let newInput = [-1.0, 0.9, 1.1]
        let weightedSum = newInput[0] * weights[0] + newInput[1] * weights[1] + newInput[2] * weights[2]
        let output = degrau(weightedSum)
        print("Saída para \(newInput): \(output)")
    }
}
