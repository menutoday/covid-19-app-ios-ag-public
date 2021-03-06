//
// Copyright © 2020 NHSX. All rights reserved.
//

import Scenarios
import XCTest

class PositiveSymptomsScreenTests: XCTestCase {
    
    @Propped
    private var runner: ApplicationRunner<PositiveSymptomsScreenScenario>
    
    func testBasics() throws {
        try runner.run { app in
            let screen = PositiveSymptomsScreen(app: app)
            
            XCTAssert(screen.pleaseIsolateLabel.exists)
            XCTAssert(screen.indicationLabel.exists)
            XCTAssert(screen.explanationLabel.exists)
            XCTAssert(screen.bookTestButton.exists)
            XCTAssert(screen.furtherAdviceButton.exists)
        }
    }
    
    func testReturnHome() throws {
        try runner.run { app in
            let screen = PositiveSymptomsScreen(app: app)
            
            screen.bookTestButton.tap()
            XCTAssert(screen.returnHomeAlertTitle.exists)
        }
    }
    
    func testFurtherAdvice() throws {
        try runner.run { app in
            let screen = PositiveSymptomsScreen(app: app)
            
            screen.furtherAdviceButton.tap()
            XCTAssert(screen.furtherAdviceAlertTitle.exists)
        }
    }
}

private extension PositiveSymptomsScreen {
    var returnHomeAlertTitle: XCUIElement {
        app.staticTexts[PositiveSymptomsScreenScenario.bookTestTapped]
    }
    
    var furtherAdviceAlertTitle: XCUIElement {
        app.staticTexts[PositiveSymptomsScreenScenario.furtherAdviceTapped]
    }
}
