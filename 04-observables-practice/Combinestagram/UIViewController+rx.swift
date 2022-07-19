//
//  UIViewController+rx.swift
//  Combinestagram
//
//  Created by Uriel Hernandez Gonzalez on 19/07/22.
//  Copyright © 2022 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
  func alert(title: String, text: String? = nil) -> Completable {
    return Completable.create { [weak self] completable in
      let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
        completable(.completed)
      }))
      
      self?.present(alertVC, animated: true)
      
      return Disposables.create {
        self?.dismiss(animated: true)
      }
    }
  }
}
