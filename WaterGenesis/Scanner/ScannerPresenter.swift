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
        guard let access = Token.shared.getAccessToken(), let data = decryptedData else { return }
      
        requestGet(bearer: access, url: "https://dev.waterlabelserver.com/v1/wtg/scan?code=\(data)", model: "Qr", completionHandler: { com, result in
            if com {
                if let code = result as? Qr {
                    Model.shared.setQr(qr: code)
                    self.view.endedScanned(result: true)
                }
            } else {
                
                
            }
            
        })
        
        
    }
    
    
}
