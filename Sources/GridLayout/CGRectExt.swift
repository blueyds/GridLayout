//
//  CGRectExt.swift
//  SFSymbolRPG
//
//  Created by Craig Nunemaker on 6/24/23.
//

import Foundation

extension CGRect{
	public var row: CGFloat {
		get{
			self.origin.y
		}
		set {
			self.origin.x = newValue
		}
	}
	public var col: CGFloat {
		get{
			self.origin.x
		}
		set{
			self.origin.x = newValue
		}
	}
	public init(row: CGFloat, column: CGFloat, height: CGFloat, width: CGFloat){
		self.init(x: column, y: row, width: width, height: height)
	}
}