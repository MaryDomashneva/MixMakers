//
//  HomepageViewControllerSnapshotSpec.swift
//  MixMakersTests
//
//  Created by Andrew Kemp on 06/06/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//
import Quick
import Nimble
import Nimble_Snapshots
import UIKit
import OHHTTPStubs

@testable import MixMakers

class HomepageViewControllerSnapshotSpec: QuickSpec {
        override func spec() {
            var viewController: HomepageViewController!
            
            beforeEach {
                viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage") as! HomepageViewController
            }
                
                it("has valid snapshot") {
                    let view = viewController.view
                    waitUntil { done in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            done()
                        }
                    }
                    expect(view).to( haveValidSnapshot() )
            }
        }
}
