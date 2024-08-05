//
//  FirstPresenter.swift
//  AnimeSearch
//
//  Created by Matheus Dionísio on 23/06/24.
//

import Foundation
import UIKit

protocol FirstPresenterProtocol {
    func viewDidLoad()
    func imageTapped()
}

class FirstPresenter: FirstPresenterProtocol {
    
    weak var view: FirstViewProtocol?
    
    init(view: FirstViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        // Lógica de inicialização, como configuração de URL do GIF
        if let url = URL(string: "https://i.pinimg.com/originals/26/f5/49/26f5498675a42fee2aa35442209c4f3b.gif") {
            view?.showGifImage(from: url)
        }
        view?.startLabelBlinkAnimation()
    }
    
    func imageTapped() {
        // Lógica de navegação para a próxima tela
        let mainViewController = MainViewController()
        if let navigationController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            navigationController.setViewControllers([mainViewController], animated: true)
        }
    }
}
