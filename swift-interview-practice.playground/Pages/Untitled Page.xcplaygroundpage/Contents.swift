import UIKit

func numIslands(_ grid: [[Character]]) -> Int {
    // we will store the registered Islands and their lands;
    var grid = grid
    if grid.isEmpty {
        return 0
    }
    var count = 0
    let row = grid.count, col = grid[0].count
    for i in 0..<row {
        for j in 0..<col {
            if grid[i][j] == "1" {
                // DFS
//               DFS(grid: &grid, i, j)
                // BFS
                BFS(&grid, i, j)
               count += 1
            }
        }
    }
    return count
}
func BFS(_ grid: inout [[Character]], _ x: Int, _ y: Int)
{
    var q = [[Int]]()
    q.append([x,y])
    grid[x][y] = "0"
    while !q.isEmpty {
        let i = q.first![0], j = q.first![1]
        q.remove(at: 0)
        if i-1 >= 0 && grid[i-1][j] == "1" {
            grid[i-1][j] = "0"
            q.append([i-1, j])
        }
        if i+1 < grid.count && grid[i+1][j] == "1" {
            grid[i+1][j] = "0"
            q.append([i+1, j])
        }
        if j-1 >= 0 && grid[i][j-1] == "1" {
            grid[i][j-1] = "0"
            q.append([i, j-1])
        }
        if j+1 < grid[0].count && grid[i][j+1] == "1" {
            grid[i][j+1] = "0"
            q.append([i, j+1])
        }
    }
    for row in grid {
        print("\(row)")
    }
    print("\n")
}
func DFS(grid: inout [[Character]], _ x: Int, _ y: Int)
{
    if grid[x][y] == "1" {
        grid[x][y] = "0"
        if x - 1 >= 0 && grid[x-1][y] == "1" {
            DFS(grid: &grid, x-1, y)
        }
        if y - 1 >= 0 && grid[x][y-1] == "1" {
            DFS(grid: &grid, x, y-1)
        }
        if x + 1 < grid.count && grid[x+1][y] == "1" {
            DFS(grid: &grid, x+1, y)
        }
        if y + 1 < grid[0].count && grid[x][y+1] == "1" {
            DFS(grid: &grid, x, y+1)
        }
    }
}

print(numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]))

/*
 TC: O(M * N)
 SC: O(M * N)
 */
