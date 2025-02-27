// Obj-C
#import "RTNAarand.h"
#import "Aarand.hpp"  // Import C++ header

@implementation RTNAarand

RCT_EXPORT_MODULE()

- (void)add:(double)a b:(double)b resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    // NSNumber *result = [[NSNumber alloc] initWithInteger:a+b]; // Objective-C implementation
    double cppResult = aarand_example::Aarand::add(a, b); // C++ implementation
    NSNumber *result = @(cppResult);  // @() is shorthand for numberWithDouble
    resolve(result);
}

- (void)performAarandLogic:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    // Call the C++ implementation
    std::string cppResult = aarand_example::Aarand::performAarandLogic();
    
    // Convert std::string to NSString
    NSString *result = [NSString stringWithUTF8String:cppResult.c_str()];
    
    // Resolve the promise with the result
    resolve(result);
}


- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeRTNAarandSpecJSI>(params);
}

@end