//
//  PHPhotoLibrary+Rx.swift
//  Combinestagram
//
//  Created by Uriel Hernandez Gonzalez on 20/07/22.
//  Copyright © 2022 Underplot ltd. All rights reserved.
//

import Foundation
import RxSwift
import Photos

extension PHPhotoLibrary {
  static var authorized: Observable<Bool> {
    return Observable.create { observer in
      
      DispatchQueue.main.async {
        if authorizationStatus() == .authorized {
          observer.onNext(true)
          observer.onCompleted()
        } else {
          observer.onNext(false)
          requestAuthorization { newStatus in
            observer.onNext(newStatus == .authorized)
            observer.onCompleted()
          }
        }
      }
      
      return Disposables.create()
    }
  }
}
