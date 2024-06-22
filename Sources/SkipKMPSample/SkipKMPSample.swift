// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

// tantamount to: import multi.platform.library.__
import MultiPlatformLibrary

public class SkipKMPSampleModule {
    static func stringFunction() -> String {
        #if SKIP
        Singleton.stringFunction()
        #else
        Singleton.shared.stringFunction()
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
}
