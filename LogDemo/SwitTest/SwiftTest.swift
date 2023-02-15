//
//  SwiftTest.swift
//  LogDemo
//
//  Created by 杨杰 on 2023/2/15.
//  Copyright © 2023 mumu. All rights reserved.
//

import Foundation

@objc public class SwiftClass: NSObject {
    
    @objc public var _callback: (() -> Void)?
    
    @objc public func sayHello(callBack: @escaping () -> Void) {
        print("hello")
        _callback = callBack
//        callBack()
    }
    
    let simple: MMSimpleFuncModel = MMSimpleFuncModel()
    
    @objc public func callOC() {
        simple.helloBlock = { [weak self] in
            guard let self = self else { return }
            self.simple.nullBlock = { str in
                print("call->\(self), \(str)")
            }
        }
        simple.helloBlock?()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.simple.nullBlock?("test")
        }
    }
    
    deinit {
        print("test->\(self)")
    }
}
