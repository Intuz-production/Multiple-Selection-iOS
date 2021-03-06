//
//  CollectionExtensions.swift
//  SwifterSwift
//
//  Created by Sergey Fedortsov on 19.12.16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//

import Foundation


// MARK: - Methods
extension Collection {
	
	private func indicesArray() -> [Self.Index] {
		var indices: [Self.Index] = []
		var anIndex = startIndex
		while anIndex != endIndex {
			indices.append(anIndex)
			anIndex = index(after: anIndex)
		}
		return indices
	}
	
	/// SwifterSwift: Performs `each` closure for each element of collection in parallel.
	///
	/// - Parameter each: closure to run for each element.
    func forEachInParallel(_ each: (Self.Iterator.Element) -> ()) {
		let indices = indicesArray()
		
		DispatchQueue.concurrentPerform(iterations: indices.count) { (index) in
			let elementIndex = indices[index]
			each(self[elementIndex])
		}
	}
	
}

extension Collection where Indices.Iterator.Element == Index {
	
	/// SwifterSwift: Safe protects the array from out of bounds by use of optional.
	///
	///- Parameter index: Index of element to access element.
	///- Returns: Optional element at index (if applicable).
	///- Usage: array[safe: index]
	public subscript (safe index: Index) -> Iterator.Element? {
		return indices.contains(index) ? self[index] : nil
	}
	
}

extension Collection where Index == Int, IndexDistance == Int {
	
	/// SwifterSwift: Random item from array.
	public var randomItem: Iterator.Element {
		let index = Int(arc4random_uniform(UInt32(count)))
		return self[index]
	}

}

// MARK: - Methods (Integer)
extension Collection where Iterator.Element == Int, Index == Int {
	
	/// SwifterSwift: Average of all elements in array.
    /// Returns: the average of the array's elements (Double).
	public func average() -> Double {
		// http://stackoverflow.com/questions/28288148/making-my-function-calculate-average-of-array-swift
		return isEmpty ? 0 : Double(reduce(0, +)) / Double(endIndex-startIndex)
	}
	
}

