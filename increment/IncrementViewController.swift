//
//  ViewController.swift
//  increment
//
//  Created by ryo.inomata on 2022/06/03.
//

import UIKit
import RxSwift
import RxCocoa

class IncrementViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    //値を保持
    private let count: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    private let disposeBag: DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindButtonToValue()
        bindCountToText()
    }
    private func bindButtonToValue(){
        //inはクロージャーの形式を参考に
        //強参照、弱参照。deinit、disposeBag。
        button.rx.tap.subscribe(onNext: {[weak self] _ in self?.increment()}).disposed(by: disposeBag)
    }
    private func increment(){
        count.accept(count.value + 1)
    }
    private func bindCountToText() {
        //labelが監視可能に⇨通知を(countの)=String化のちメモリ解放
        count.asObservable().subscribe(onNext: {[weak self] count in self?.label.text = String(count) }).disposed(by: disposeBag)
    }
}

