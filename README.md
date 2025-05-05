# React Native (Expo) Turbo Module for [Aaron's C++ random distributions](https://github.com/LTLA/aarand)


## CPP Turbomodules with Expo
1) Make sure Turbomodule folder exists
2) Run `npm install ./RTNAarand`. This will added RTNAarand as a dependency in your app's package.json like `"rtn-aarand": "file:./RTNAarand"`. The name "rtn-aarand" comes from the name field in the `RTNAarand/package.json` file.
3) Codegen script: from your main app's root directory (outside RTNAarand), where your app's package.json is located, run: `node node_modules/react-native/scripts/generate-codegen-artifacts.js --targetPlatform ios --path ./ --outputPath ./RTNAarand/generated/`. Note, for codegen to find your RTNAarand module, it needs to be registered as a dependency in your app's package.json which we did with the `npm install ./RTNAarand` command.

## Usefule scripts
- `npm run build-turbo` to rebuild Turbo Modules after editing. See package.json for details. 

### Notes
You need to use Objective-C++ (.mm) as a bridge between React Native's Objective-C world and C++ because React Native's iOS layer is built on Objective-C. Let me show the complete, exact modification:


#### Considerations when using C++
Import the C++ header with #import "Aarand.hpp"
Replace the direct calculation with a call to the C++ implementation:

with 
```objective-c
// NSNumber *result = [[NSNumber alloc] initWithInteger:a+b]; // Objective-C implementation
double cppResult = aarand_example::Aarand::add(a, b); // C++ implementation
NSNumber *result = @(cppResult);  // @() is shorthand for numberWithDouble
resolve(result);
```

For iOS you always need to:

Use .mm extension for files that mix Objective-C and C++
Bridge between Objective-C and C++ in these files
Keep pure C++ code in .cpp files
Use the Objective-C++ files to connect React Native's Objective-C layer with your C++ code

This is because:

React Native's iOS runtime is written in Objective-C
The JSI (JavaScript Interface) expects Objective-C objects
Native modules must conform to Objective-C protocols



#### Example Setup

```
RTNAarand/
├── ios
│   ├── Aarand.cpp
│   ├── Aarand.hpp
│   ├── RTNAarand.h
│   └── RTNAarand.mm
├── js
│   └── NativeRTNAarand.ts
├── generated (auto-generated with Codegen script)
├── package.json
└── rtn-aarand.podspec
```

## Launching Expo app

1. Install dependencies (if you haven't already)

   ```bash
   npm install
   ```

2. Start the app

   ```bash
    npx expo run:ios
   ```

#### More info on Codegen
So when you run the codegen command from your app's root, it:

1) Reads your app's package.json
2) Finds the `rtn-aarand` dependency
3) Follows the path to `./RTNAarand`
4) Generates code based on your module's specs
5) Places the output in ./RTNAarand/generated/
