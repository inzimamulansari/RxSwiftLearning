//
//  ViewController.swift
//  RxSwiftLearning
//
//  Created by Apple on 06/04/22.
//

import UIKit
import RxSwift
import RxCocoa


//what is RxSwift?
//1 . Observables - observable emits noti of changes
//2 .Observer - the observer subscribe to its and gets notified when the obserable is changed
//3. Disposable Bag - it helps with ARC & memory mngt


class ViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var TestLbl:UILabel!
    
    @IBOutlet weak var tableView:UITableView!

    let intArr = Observable.just(["1","2","3"])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        
        let observable = Observable.of(1)

        let observable1 = Observable.of(1,2,3,4)

        let observable2 = Observable.of([1,2,3,4])

        let observable3 = Observable.from([1,2,3,4])
        
         
        observable3.subscribe { event in
         print(event)
        }.disposed(by: disposeBag)
        
        //        let button = UIButton()

        //        button.rx.tap.bind {
        //            print("button has tapped")
        //        }.disposed(by: disposeBag)


        //        self.slider.rx.value.subscribe(onNext: {
        //            self.TestLbl.text = "\($0)"
        //        }).disposed(by: disposeBag)
        //
        
        //Cell for row UI
        intArr.bind(to: tableView.rx.items(cellIdentifier: "cell")) {
            (row, intArrElement, cell) in
            cell.textLabel?.text = intArrElement
            print(row)
        }.disposed(by: disposeBag)
        
        //didSelect click action
        tableView.rx.itemSelected.subscribe(onNext: {
          click in
        print(click.row)
        }).disposed(by: disposeBag)
        
        
    }


}

