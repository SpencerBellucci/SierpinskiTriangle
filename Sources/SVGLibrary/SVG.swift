//
//  SVG.swift
//  SierpinskiSwift
//
//  A class that can be used to generate
//  a basic SVG file.

import Foundation

open class SVG {
    // keeps track of string for writting
    var contents: String = ""
    
    public func draw_line(x1: Int, y1: Int, x2: Int, y2: Int) {
        // draw a line using coordinates
        contents = contents + "<line x1=\"" + String(x1) + "\" y1=\"" + String(y1) + "\" x2=\"" + String(x2) + "\" y2=\"" + String(y2) + "\" stroke=\"black\" />\n"
    }
    
    public func draw_triangle(p1: Point, p2: Point, p3: Point) {
        // draw multiple lines to form triangle
        draw_line(x1: p1.x, y1: p1.y, x2: p2.x, y2: p2.y)
        draw_line(x1: p2.x, y1: p2.y, x2: p3.x, y2: p3.y)
        draw_line(x1: p3.x, y1: p3.y, x2: p1.x, y2: p1.y)
    }
    
    // Initialize the SVG file with commands that will create a
    // width x height canvas
    public init(width: UInt, height: UInt) {
        // initilize the svg file
        contents = contents + "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
        contents = contents + "<svg version=\"1.1\" baseProfile=\"full\" width=\"" + String(width) + "\" height=\"" + String(height) + "\" xmlns=\"http://www.w3.org/2000/svg\">\n"
    }
    
    // Write the SVG file to disk
    public func write(filePath: String) {
        // add end of svg file
        contents = contents + "</svg>\n"
        
        // write to file and catch errors
        do {
            try contents.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
    }
}
