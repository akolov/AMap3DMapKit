//
//  AMap3DMapKitTests.swift
//  
//
//  Created by Alexander Kolov on 2022-02-08.
//

@testable import AMap3DMapKit
import Foundation
import InterposeKit
import XCTest

final class AMap3DMapKitTests: XCTestCase {

  func test() throws {
    MAMapView.swizzleAMapBundleCalls()
    AMapServices.shared().apiKey = "123"
    MAMapView.updatePrivacyShow(.didShow, privacyInfo: .didContain)
    MAMapView.updatePrivacyAgree(.didAgree)
    let map = MAMapView()
    XCTAssertNotNil(map)
  }

}
