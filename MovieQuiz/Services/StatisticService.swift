//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Iuliia Kalashnikova on 16.11.2024.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
        case total
        case date
        case correctAnswer
    }
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
            }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
            }
    }
    
    var bestGame: GameResult {
        get {
            let correct: Int = storage.integer(forKey: Keys.correct.rawValue)
            let total: Int = storage.integer(forKey: Keys.total.rawValue)
            let date: Date = storage.object(forKey: Keys.total.rawValue) as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
                }
                set {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(newValue.total, forKey: Keys.total.rawValue)
            storage.set(newValue.date, forKey: Keys.total.rawValue)
                }
    }
    
    private var correctAnswers: Int{
           get{
               storage.integer(forKey: Keys.correctAnswer.rawValue)
           }
           set{
               storage.set(newValue, forKey: Keys.correctAnswer.rawValue)
           }
       }
    var totalAccuracy: Double {
        Double(storage.integer(forKey: Keys.correctAnswer.rawValue)) * 100 / (Double(gamesCount) * 10)
    }
    
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        
        let bestCorrectCount = storage.object(forKey: Keys.correct.rawValue) as? Int ?? -1
        if bestCorrectCount < count {
            storage.set(count, forKey: Keys.correct.rawValue)
                }
                
        let bestTotal = storage.object(forKey: Keys.total.rawValue) as? Int ?? -1
                
        if bestTotal < amount {
        storage.set(amount, forKey: Keys.total.rawValue)
                }
    }
}

