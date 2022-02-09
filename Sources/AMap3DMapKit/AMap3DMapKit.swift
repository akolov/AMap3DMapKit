//
//  AMap3DMapKit.swift
//  
//
//  Created by Alexander Kolov on 2022-02-08.
//

import Foundation
import InterposeKit
@_exported import MAMapKit

extension MAMapView {

  public static func swizzleAMapBundleCalls() {
    _ = try? Interpose(Bundle.self) {
      try $0.hook(
        #selector(Bundle.path(forResource:ofType:)),
        methodSignature: (@convention(c) (AnyObject, Selector, String?, String?) -> String?).self,
        hookSignature: (@convention(block) (AnyObject, String?, String?) -> String?).self) {
          store in { me, name, ext in
            guard name == "AMap" && ext == "bundle" && me.bundleIdentifier != "AMap3DMapKit-AMap3DMapKit-resources" else {
              return store.original(me, store.selector, name, ext)
            }
            return Bundle.module.path(forResource: name, ofType: ext)
          }
        }
    }
  }

}
