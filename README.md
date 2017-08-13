# forecast

a command line utility for looking up the weather report

the purpose of this project is to learn to build a cross-platform application in Swift 4.0.

## Building

#### macOS

Prerequisites:

Install the required swift toolchain. The toolchain version is specified in the `.swift-version` file.
  * Option A: [`swiftenv`](https://swiftenv.fuller.li/en/latest/) can be used to install the toolchain and modify your
    environment so your PATH contains the right version of the swift tools.
  * Option B: Download and install the toolchain from <https://swift.org/download/>. In order to reference the right
    version of the swift tools, prefix the commands with `xcrun --toolchain TOOLCHAIN_ID`, where `TOOLCHAIN_ID` is
    Apple's embedded identifier (you can read this value from the Bundle Identifier key in
    `/Library/Developer/Toolchains/swift-VERSION.xctoolchain/Info.plist`).

1. Run `swift build -c release` in the project directory.

#### Linux

Prerequisites:

Install Docker.

1. Run `docker build -t forecast .`

## Running

Prerequisites:

You must have a registered API key from [DarkSky's Developer portal](https://darksky.net/dev) and use it as the
environment variable `DARKSKY_SECRET`.

#### macOS

1. The executable will be output to `DARKSKY_SECRET=XXX .build/release/forecast`, just invoke it from the command line.


#### Linux

1. Run `docker run -e "DARKSKY_SECRET=XXX" forecast` to run the executable inside the Docker container.


