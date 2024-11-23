//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Iuliia Kalashnikova on 16.11.2024.
//

import UIKit

 final class AlertPresenter: AlertPresenterProtocol {
     
    private weak var delegate: UIViewController?
    
    func showAlert(model: AlertModel){
        let alert = UIAlertController(
            title:  model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        alert.view.accessibilityIdentifier = "Alert"
        
        let action = UIAlertAction(title:  model.buttonText, style: .default) {  _  in
            model.completion()
        }
        alert.addAction(action)
        
        delegate?.present(alert, animated: true, completion: nil)
    }
    func setup (delegate: UIViewController){
        self.delegate = delegate
        
    }
}
