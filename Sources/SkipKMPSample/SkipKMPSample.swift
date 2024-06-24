// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

// Skip transpiles this to: import multi.platform.library.*
import MultiPlatformLibrary

public class SkipKMPSampleModule {
    static func stringFunction() -> String {
        // an oddity of the Kotlin/Native ObjC target is that it doesn't map object functions to statics, but instead to an instance function on a `shared` singleton
        #if SKIP
        return Singleton.stringFunction()
        #else
        return Singleton.shared.stringFunction()
        #endif
    }

    static func performAdd() -> Double {
        let instance = SampleClass(stringField: "XYZ", intField: Int32(123), doubleField: 12.23)
        return instance.addNumbers()
    }

    static func checkEnumClass() -> Int32 {
        let enumA = SampleEnum.a
        let enumB = SampleEnum.b
        let enumC = SampleEnum.c
        return enumA.rawValue + enumB.rawValue + enumC.rawValue
    }

    static func checkDiceRoller(diceCount: Int32, sideCount: Int32, uniqueRollsOnly: Bool = true) throws -> [Int32] {
        let dr = DiceRoller()
        let settings = DiceSettings(diceCount: diceCount, sideCount: sideCount, uniqueRollsOnly: uniqueRollsOnly)
        let results = try dr.rollDice(settings: settings)
        let resultArray: [Int32] = Array(results).map({ kotlinInt in
            // this is a KotlinInt (NSNumber) in ObjC/Swift but a regular Int32 in Kotlin
            #if SKIP
            kotlinInt
            #else
            kotlinInt.int32Value
            #endif
        })
        return resultArray
    }

    // needs @MainActor
    // or else set gradle.properties kotlin.native.binary.objcExportSuspendFunctionLaunchThreadRestriction=none
    // or else:
    // *** Terminating app due to uncaught exception 'NSGenericException', reason: 'Calling Kotlin suspend functions from Swift/Objective-C is currently supported only on main thread'
    static func checkAsync(duration: Int64, value: String) async throws -> String {
        try await SampleAsync().performSuspend(duration: duration, value: value)
    }

}
