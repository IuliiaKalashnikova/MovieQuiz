//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Iuliia Kalashnikova on 14.11.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject { 
    func didReceiveNextQuestion(question: QuizQuestion?)
}
