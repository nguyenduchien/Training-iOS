//: Playground - noun: a place where people can play

import Foundation
import UIKit
typealias Validation = (isValid: Bool, message: String)
enum Result {
    case success(Triangle)
    case failure(String)
}

enum Triangle {
    case thuong
    case can
    case deu
    case vuong
    case vuongcan
    case none
    var title: String {
        switch self {
        case .can :
            return "Day la tam giac can"
        case .deu :
            return "Day la tam giac deu"
        case .vuong :
            return "Day la tam giac vuong"
        case .vuongcan :
            return "Day la tam giac vuong can"
        case .none :
            return "Day khong phai la tam giac"
        default:
            return "Day la tam giac thuong"
        }
    }
}

struct TriangleInput {
    
    var canhA: Float = 0.0
    var canhB: Float = 0.0
    var canhC: Float = 0.0
    
    private func validation() -> Validation {
        guard canhA > 0, canhB > 0, canhC > 0 else {
            return (false, "Nhap canh A lon hon 0")
        }
        guard canhB > 0 else {
            return (false, "Nhap canh B lon hon 0")
        }
        guard canhC > 0 else {
            return (false, "Nhap canh C lon hon 0")
        }
        if canhA + canhB <= canhC || canhA + canhC <= canhB || canhB + canhC <= canhA  {
            return (false, "Day khong phai kieu tam giac")
        }
        return (true, "")
    }
    
    func typeTriangle() -> Result {
        guard data.validation().isValid else {
            return .failure(data.validation().message)
        }
        
        if (canhA == canhB) || (canhA == canhC) || (canhC == canhB) {
            return .success(.can)
        }
        else if (canhA==canhB) && (canhA==canhC) && (canhC==canhB) {
            return .success(.deu)
        }
        else if (canhA*canhA==canhB*canhB+canhC*canhC) || (canhB*canhB==canhA*canhA+canhC*canhC) || (canhC*canhC==canhB*canhB+canhA*canhA)  {
            return .success(.vuong)
        }
        else if ((canhA*canhA==canhB*canhB+canhC*canhC)&&(canhB==canhC)) || ((canhB*canhB==canhA*canhA+canhC*canhC)&&(canhA==canhC)) || ((canhC*canhC==canhB*canhB+canhA*canhA)&&(canhB==canhA))  {
            return .success(.vuongcan)
        }
        return .success(.thuong)
    }
}

var data = TriangleInput(canhA: -3, canhB: 4, canhC: 5)
switch data.typeTriangle() {
    case .success(let rec):
        print(rec.title)
    case .failure(let errorMsg):
        print(errorMsg)
}
