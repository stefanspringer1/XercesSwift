@_exported import ObjCXercesSwift

open class XMLParseConsumer {
    public init() {}
    open func startElement(name: String) {}
}

private func utf16Buffer2String(buffer:UnsafeMutableRawPointer, length: Int32) -> String {
    let _length = Int(length)
    let int8Ptr = buffer.bindMemory(to: UInt16.self, capacity: _length)
    let int8Buffer = UnsafeBufferPointer(start: int8Ptr, count: _length)
    let array = Array(int8Buffer)
    return String(utf16CodeUnits: array, count: _length)
}

func startElement(consumerRef: UnsafeMutableRawPointer, buffer: UnsafeMutableRawPointer, length: Int32) {
    let name = utf16Buffer2String(buffer: buffer, length: length)
    let consumer = Unmanaged<XMLParseConsumer>.fromOpaque(consumerRef).takeUnretainedValue()
    consumer.startElement(name: name)
}

public class XercesParser {
    
    let parseConsumer: XMLParseConsumer
    let xercesWrapper: XercesWrapper
    
    public init(withParseConsumer parseConsumer: XMLParseConsumer) {
        self.parseConsumer = parseConsumer
        xercesWrapper = XercesWrapper()
        xercesWrapper.parseConsumer = UnsafeMutableRawPointer(Unmanaged.passUnretained(parseConsumer).toOpaque())
        xercesWrapper.startElement = startElement
    }

    public func parse(fromPath path: String) -> Int {
        return Int(xercesWrapper.parse(path))
    }
}
