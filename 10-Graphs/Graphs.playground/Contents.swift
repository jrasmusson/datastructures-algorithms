import Foundation

/*
  ___               _
 / __|_ _ __ _ _ __| |_  ___
| (_ | '_/ _` | '_ \ ' \(_-<
 \___|_| \__,_| .__/_||_/__/
              |_|
 */

struct Queue<T> {
    private var array: [T]
    
    init() {
        array = []
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func add(_ element: T) {
        array.append(element)
    }
    
    mutating func remove() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
}

struct Stack<T> {
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    var top: T? {
        return array.last
    }
}

class Graph {
    var V = 0                       // number of vertices
    var adj = [[Int]]()             // adjacency list
    
    init(_ V: Int) {
        self.V = V
        for _ in 0..<V {
            adj.append([Int]())     // create empty array of adjacency lists
        }
    }
    
    func addEdge(v: Int, w: Int) {
        adj[v].append(w)
    }
    
    // BFS traversal from a given source s
    func BFS(s: Int) -> [Int] {
        
        var result = [Int]()
        
        // Mark all vertices as not visited
        var visited = adj.map { _ in false }
        
        // Create BFS Queue
        var queue = Queue<Int>()
        
        // Mark first vertex as visited and enqueue
        visited[s] = true
        print("Starting at \(s)")
        queue.add(s)
        result.append(s)
        
        while queue.count > 0 {
            let current = queue.remove()!
            print("De-queueing \(current)")
            
            // Get all the adjacent vertices of the current vertex
            // If adjacent has not being visited, mark visited and enqueue
            
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    print("Queuing \(n)")
                    queue.add(n)
                    result.append(n)
                }
            }
         }
        
        return result
    }
    
    // DFS traversal from a given source s
    func DFS(s: Int) -> [Int] {
        
        var result = [Int]()
        
        // Mark all vertices as not visited
        var visited = adj.map { _ in false }
        
        // Create DFS Stack
        var stack = Stack<Int>()
        
        // Mark first vertex as visited and enqueue
//        print("Starting at \(s)")
        visited[s] = true
        stack.push(s)
        
        while stack.count > 0 {
            let current = stack.pop()!
//            print("Popping \(current)")
            result.append(current)
            
            // Iterate over all neighbours adding to queue and popping deep as we go
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
//                    print("Pushing - \(n)")
                    stack.push(n)
                }
            }
        }
        
        return result
    }
}

// Need to have as many vertices as you have edges
let g = Graph(8)
g.addEdge(v: 0, w: 1)
g.addEdge(v: 1, w: 4)
g.addEdge(v: 4, w: 6)
g.addEdge(v: 6, w: 0)
g.addEdge(v: 1, w: 5)
g.addEdge(v: 5, w: 3)
g.addEdge(v: 3, w: 0)
g.addEdge(v: 5, w: 2)
g.addEdge(v: 2, w: 7)

//g.BFS(s: 0)
print(g.DFS(s: 0))

/*
 Graph
               ┌────┐           ┌────┐      ┌────┐
 ┌────────────▶│ 5  │◀──────────▶ 2  │◀─────▶ 7  │
 │             └────┘           └────┘      └────┘
 │                ▲
 │                └─────────┐
 │                          │
 ▼                          ▼
 ┌────┐          ┌────┐     ┌────┐
 │ 1  │◀────────▶│ 0  │◀────▶ 3  │
 └────┘          └────┘     └────┘
 ▲               │
 ▼               ▼
 ┌────┐          ┌────┐
 │ 4  │◀─────────▶ 6  │
 └────┘          └────┘
 
 */
