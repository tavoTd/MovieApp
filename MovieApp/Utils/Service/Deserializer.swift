//
//  Deserializer.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

public protocol Deserializer {

    associatedtype ResponseType = Any

    /// The `Accept` Hader to send in the request, ex: `application/json`
    var acceptHeader: String { get }

    init()

    /// Deserializes the data returned by the web server to the desired type.
    /// - parameter data: The data returned by the server.
    /// - returns: The deserialized value of the desired type.
    func deserialize(_ data: Data) throws -> ResponseType
}



/// A `Deserializer` for Swift 4's `Decodable` protocol
public class DecodableDeserializer<T: Decodable>: Deserializer {

    public typealias ResponseType = T

    public let acceptHeader = "application/json"

    public required init() { }

    public func deserialize(_ data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}

/// A `Deserializer` for `Void` (for use with servers that return no data).
public class VoidDeserializer: Deserializer {

    public typealias ResponseType = Void

    public let acceptHeader = "*/*"

    public required init() { }

    public func deserialize(_ data: Data) throws -> Void {
        // do nothing
        return Void()
    }
}

#if os(iOS) || os(watchOS) || os(tvOS)
    /// A `Deserializer` for `UIImage`
    public class ImageDeserializer: Deserializer {

        public typealias ResponseType = UIImage

        public let acceptHeader = "image/*"

        public required init() { }

        public func deserialize(_ data: Data) throws -> UIImage {
            guard let image = UIImage(data: data) else {
                throw NetworkError.malformedResponse(data)
            }
            return image
        }
    }
#elseif os(OSX)
    /// A `Deserializer` for `NSImage`
    public class ImageDeserializer: Deserializer {

    public typealias ResponseType = NSImage

    public let acceptHeader = "image/*"

    public required init() { }

    public func deserialize(_ data: Data) throws -> NSImage {
        guard let image = NSImage(data: data) else {
            throw NetworkError.malformedResponse(data)
        }
        return image
    }
}
#endif

/// A `Deserializer` for `Data`
public class DataDeserializer: Deserializer {

    public typealias ResponseType = Data

    public let acceptHeader = "*/*"

    public required init() { }

    public func deserialize(_ data: Data) throws -> Data {
        return data
    }
}

/// A `Deserializer` for `Data`
public class TextDeserializer: Deserializer {

    public typealias ResponseType = String

    public let acceptHeader = "text/plain"

    public required init() { }

    public func deserialize(_ data: Data) throws -> String {
        guard let value = String(data: data, encoding: .utf8) else {
            throw NetworkError.malformedResponse(data)
        }
        return value
    }
}

/// A `Deserializer` for `Dictionary`
public class DictionaryDeserializer: Deserializer {
    

    public typealias ResponseType = Dictionary<String, Any>

    public let acceptHeader = "application/json"

    public required init() { }

    public func deserialize(_ data: Data) throws -> Dictionary<String, Any> {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []), let dictionary = json as? [String: Any] else {
            throw NetworkError.malformedResponse(data)
        }
        return dictionary
    }
}
