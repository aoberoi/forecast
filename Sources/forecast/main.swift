import Foundation
import Dispatch

let darkSkySecretKey = "0132f30663560ef7cbe88d63e6c15781"

let lat = 37.7749
let long = -122.4194

let defaultSession = URLSession(configuration: .default)
if let forecastUrl = URL(string: "https://api.darksky.net/forecast/\(darkSkySecretKey)/\(lat),\(long)") {
    print("forecastUrl: \(forecastUrl)")
    let dataTask = defaultSession.dataTask(with: forecastUrl) { data, response, error in
        if let error = error {
            print("An error occurred: \(error.localizedDescription)")
        } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print("Data received");
            do {
                if let forecastResult = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> {
                    if let currently = forecastResult["currently"] as? Dictionary<String, Any> {
                        if let summary = currently["summary"] as? String {
                            print("San Francisco weather is \(summary)")
                        } else {
                            print("Count not convert 'summary' to String")
                        }
                    } else {
                        print("Could not convert key 'currently' to Dictionary<String, String>")
                    }
                } else {
                    print("Could not convert JSON to Dictionary<String, Any>")
                }
            } catch let parseError {
                print("JSONSerialization error: \(parseError.localizedDescription)\n")
            }
        } else {
            print("Status code was not 200?")
        }
        exit(0)
    }
    dataTask.resume()
    print("Task resumed")
} else {
    print("Could not form forecastUrl")
}


print("Hello, world!")
dispatchMain()
