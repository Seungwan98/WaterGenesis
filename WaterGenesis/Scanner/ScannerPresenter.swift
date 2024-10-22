//
//  ScannerPresenter.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/22/24.
//

protocol ScannerViewPresenter {
    init(view: ScannerView)
    func viewDidLoad()
    func getQrCode(codeText: String)
  
}

class ScannerPresenter: ScannerViewPresenter {
    
    let view: ScannerView
    
    required init(view: ScannerView) {
        self.view = view
    }
    
    func viewDidLoad() {
        //
    }
    
    func getQrCode(codeText: String) {
        print("\(codeText)")
       let decryptedData = DecryptAES.shared.getDecode(encodeData: codeText)
        
        // 서버 ->
        
        
    }
    
    
}
