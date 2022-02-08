//
//  AMap3DMapKitTests.swift
//  
//
//  Created by Alexander Kolov on 2022-02-08.
//

@testable import AMap3DMapKit
import Foundation
import XCTest

final class AMap3DMapKitTests: XCTestCase {

  func test() throws {
    AMapServices.shared().apiKey = "123"
    MAMapView.updatePrivacyShow(.didShow, privacyInfo: .didContain)
    MAMapView.updatePrivacyAgree(.didAgree)
  }

}
