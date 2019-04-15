//
//  foodApplicationTests.swift
//  foodApplicationTests
//
//  Created by MCS on 4/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import XCTest
@testable import foodApplication

class foodApplicationTests: XCTestCase {

    // MARK: Meal Class Tests
    
    // Confirm that the Meal initializer returns a meal object when passed valid parameters
    func testMealInitializationSucceeds() {
        
        // Zero Rating
        let zeroRatingMeal = Meal.init(name: "Zero", phot: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNotNil(largeRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
}
