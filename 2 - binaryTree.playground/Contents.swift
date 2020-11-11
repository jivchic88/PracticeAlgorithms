import UIKit

class Node {
    let value: Int
    let leftNode: Node?
    let rightNode: Node?
    init(value: Int, leftNode: Node?, rightNode: Node?) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

func summaLeaves(rootNode: Node?) -> Int {

    var sum = 0

    guard let rootNode = rootNode else { return sum }

    if rootNode.leftNode == nil && rootNode.rightNode == nil {
        sum = sum + rootNode.value
    }
    if let leftNode = rootNode.leftNode {
        sum = summaLeaves(rootNode: leftNode) + sum
    }
    if let rightNode = rootNode.rightNode {
        sum = summaLeaves(rootNode: rightNode) + sum
    }
    return sum
}
