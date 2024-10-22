//
//  DecriptAES.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/22/24.
//

import Foundation
import CommonCrypto

class DecryptAES {
    
    static let shared = DecryptAES()
    
    private let key = "1234567890abcdef" // 16Byte == 128bit
    private let initVector = "1234567890abcdef" // 16Byte

    func getDecode(encodeData: String) -> String? {
        guard let data = Data(base64Encoded: encodeData) else { return nil }
        let keyData = key.data(using: .utf8)!
        let ivData = initVector.data(using: .utf8)!
        
        // AES Decrypt
        let decryptedData = aesDecrypt(data: data, keyData: keyData, ivData: ivData)
        
        return decryptedData.flatMap { String(data: $0, encoding: .utf8) }
    }

    private func aesDecrypt(data: Data, keyData: Data, ivData: Data) -> Data? {
        let keyLength = kCCKeySizeAES128
        let cryptLength = data.count + kCCBlockSizeAES128
        var cryptData = Data(count: cryptLength)
        
        var numBytesDecrypted: size_t = 0

        let status = cryptData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                keyData.withUnsafeBytes { keyBytes in
                    ivData.withUnsafeBytes { ivBytes in
                        CCCrypt(CCOperation(kCCDecrypt),
                                CCAlgorithm(kCCAlgorithmAES),
                                CCOptions(kCCOptionPKCS7Padding),
                                keyBytes.baseAddress, keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, data.count,
                                cryptBytes.baseAddress, cryptLength,
                                &numBytesDecrypted)
                    }
                }
            }
        }

        guard status == kCCSuccess else { return nil }
        cryptData.removeSubrange(numBytesDecrypted..<cryptData.count)
        return cryptData
    }
}
