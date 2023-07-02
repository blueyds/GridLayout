import SwiftUI



public struct CustomGridLayout: Layout{
	public let rows: CGFloat
	public let columns: CGFloat
	public var cells: [CGRect]


	public init(rows: CGFloat, columns: CGFloat, cells: [CGRect]) {
		self.rows = rows
		self.columns = columns
		self.cells = cells
	}


	public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		let sizes = subviews.map(){ $0.sizeThatFits(.unspecified)}
		let averageWidth = sizes.reduce(CGFloat.zero){
			$0 + $1.width
		} / CGFloat(sizes.count)
		let averageHeight = sizes.reduce(CGFloat.zero){
			$0 + $1.height
		} / CGFloat(sizes.count)
		let result = CGSize(width: averageWidth * rows, height: averageHeight * columns)
		return CGSize(width: proposal.width ?? result.width, height: proposal.height ?? result.height)
	}

	public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		let height = (proposal.height ?? bounds.height) / rows
		let width = (proposal.width ?? bounds.width) / columns

		for n in cells.indices {
			if n >= subviews.count{
				fatalError("Cell count does noto equeal views count")
			}
			let row = cells[n].row - 1
			let column = cells[n].col - 1
			let x = column * width// + (width * cells[n].width) / 2
			let y = row * height// + (height * cells[n].height) / 2
			let subWidth = width * cells[n].width
			let subHeight = height * cells[n].height
			subviews[n].place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(width: subWidth, height: subHeight))
		}
	}

}
