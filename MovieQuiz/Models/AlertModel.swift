//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Iuliia Kalashnikova on 16.11.2024.
//

import Foundation

struct AlertModel{
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> Void
}
