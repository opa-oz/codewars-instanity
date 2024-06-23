indicies = {"a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8}


def knight(p1, p2):
    size = 8

    dx = [-2, -1, 1, 2, -2, -1, 1, 2]
    dy = [-1, -2, -2, -1, 1, 2, 2, 1]

    x = indicies[p1[0]]
    y = int(p1[1])

    s = indicies[p2[0]]
    t = int(p2[1])

    q = [(x, y)]
    visited = [[False for _ in range(size + 1)] for _ in range(size + 1)]
    visited[x][y] = True
    k_move = [[0 for _ in range(size + 1)] for _ in range(size + 1)]

    while len(q) != 0:
        cell = q.pop(0)
        if cell[0] == s and cell[1] == t:
            return k_move[cell[0]][cell[1]]

        for i in range(len(dx)):
            new_x = cell[0] + dx[i]
            new_y = cell[1] + dy[i]

            if (
                new_x >= 1 and new_x <= size and new_y >= 1 and new_y <= size
            ) and not visited[new_x][new_y]:
                visited[new_x][new_y] = True
                k_move[new_x][new_y] = k_move[cell[0]][cell[1]] + 1
                q.append((new_x, new_y))


arr = [
    ["a1", "c1", 2],
    ["a1", "f1", 3],
    ["a1", "f3", 3],
    ["a1", "f4", 4],
    ["a1", "f7", 5],
]
for w in arr:
    c = knight(w[0], w[1])
    assert c == w[2], "{} to {}: expected {}, got {}".format(w[0], w[1], w[2], c)
