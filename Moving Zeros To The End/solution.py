def move_zeros(lst):
    zeros_count = 0

    for value in lst:
        if value == 0:
            zeros_count += 1

    lst = [v for v in lst if v != 0]
    lst += [0] * zeros_count

    return lst


assert move_zeros([1, 2, 0, 1, 0, 1, 0, 3, 0, 1]) == [1, 2, 1, 1, 3, 1, 0, 0, 0, 0]
assert move_zeros([9, 0, 0, 9, 1, 2, 0, 1, 0, 1, 0, 3, 0, 1, 9, 0, 0, 0, 0, 9]) == [
    9,
    9,
    1,
    2,
    1,
    1,
    3,
    1,
    9,
    9,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
]
assert move_zeros([0, 0]) == [0, 0]
assert move_zeros([0]) == [0]
assert move_zeros([]) == []
