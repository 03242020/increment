//
//  Navigation.swift
//  increment
//
//  Created by ryo.inomata on 2022/06/08.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Rswift

class SplashViewController: UIViewController {
    
//    override func viewDidLoad() {
//        viewNext()
//    }
//
    override func viewDidAppear(_ animated: Bool) {
        loginStatus()
        viewNext()
    }
//
//    func viewNext() {
//        let storyboard: UIStoryboard = UIStoryboard(name: "IncrementViewController", bundle: nil)
//        if let vc = storyboard.instantiateInitialViewController() {
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
    
    private let login: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let disposeBag: DisposeBag = DisposeBag()
    
    private func loginStatus(){
        login.accept(true)
    }
    
    func viewNext() {
        let storyboard = R.storyboard.incrementViewController()
//        r無しで記述
//        let storyboard: UIStoryboard = UIStoryboard(name: "IncrementViewController", bundle: nil)
            if let vc = storyboard.instantiateInitialViewController() {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
}

