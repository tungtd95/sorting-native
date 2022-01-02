import Flutter
import UIKit

public class SwiftSortingNativePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sorting_native", binaryMessenger: registrar.messenger())
    let instance = SwiftSortingNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let arg = call.arguments as? Dictionary<String, Any>
      if (call.method == "sorting_native_sort") {
          let input: Array<Int>? = arg?["input"] as? Array<Int>
          if (input != nil) {
              result(quickSort(input: input!))
          } else {
              result([])
          }
      }
  }
    
    func quickSort(input: Array<Int>) -> Array<Int> {
        if (input.count <= 1) {
            return input
        }
        let pivotIdx = Int.random(in: 0...(input.count - 1))
        let pivot = input[pivotIdx]
        var left: Array<Int> = []
        var right: Array<Int> = []
        for index in input.indices {
            if (index != pivotIdx) {
                let value = input[index]
                if value >= pivot {
                    right.append(value)
                } else {
                    left.append(value)
                }
            }
        }
        var result: Array<Int> = []
        result.append(contentsOf: quickSort(input: left))
        result.append(pivot)
        result.append(contentsOf: quickSort(input: right))
        return result
    }
}
