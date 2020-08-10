//
// Copyright © 2020 NHSX. All rights reserved.
//

import Common
import Interface
import TestSupport
import XCTest
@testable import Domain
@testable import Integration

final class IsolationStateAdapterTests: XCTestCase {
    
    func testNotIsolating() {
        let state = Interface.IsolationState(domainState: .noNeedToIsolate, today: .today)
        
        TS.assert(state, equals: .notIsolating)
    }
    
    func testIsolating() {
        let timeZone = TimeZone.current
        let today = LocalDay(gregorianDay: GregorianDay(year: 2020, month: 3, day: 13), timeZone: timeZone)
        let tomorrow = LocalDay(gregorianDay: GregorianDay(year: 2020, month: 3, day: 14), timeZone: timeZone)
        
        let isolation = Isolation(untilStartOfDay: tomorrow, reason: .contactCase)
        let state = Interface.IsolationState(
            domainState: .isolate(isolation),
            today: today
        )
        
        TS.assert(state, equals: .isolating(days: 1, endDate: tomorrow.startOfDay))
    }
    
}