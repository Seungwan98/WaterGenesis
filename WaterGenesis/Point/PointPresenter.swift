//
//  ScannerPresenter.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/22/24.
//

protocol PointViewPresenter {
    init(view: PointVC)
    func viewDidLoad()
  
}

class PointPresenter: PointViewPresenter {
    
    let view: PointVC
    
    required init(view: PointVC) {
        self.view = view
    }
    
    func viewDidLoad() {
        //
    }
    
 
    
    
}
