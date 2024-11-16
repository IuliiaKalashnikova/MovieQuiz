//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Iuliia Kalashnikova on 16.11.2024.
//

import Foundation
import UIKit

protocol AlertPresenterDelegate: AnyObject {
    func startNewGame()
    func sendAlert(alert: UIAlertController)
}
