//
//  CameraPermissionsViewControllerSnapshotTests.swift
//  KanvasExampleTests
//
//  Created by Declan McKenna on 07/04/2022.
//  Copyright © 2022 Tumblr. All rights reserved.
//

@testable import Kanvas
import XCTest
import FBSnapshotTestCase

final class CameraPermissionsViewControllerSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    func testViewWithAcceptedPermissionsDoesntAppear() {
        let authorizerMock = MockCaptureDeviceAuthorizer(initialCameraAccess: .authorized,
                                                         initialMicrophoneAccess: .authorized)
        let delegate = MockCameraPermissionsViewControllerDelegate()
        let controller = CameraPermissionsViewController(captureDeviceAuthorizer: authorizerMock)
        controller.delegate = delegate
        FBSnapshotVerifyViewController(controller)
    }
}