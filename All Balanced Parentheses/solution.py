def balanced_parens(n):
    result = []

    if n == 0:
        return [""]

    def fact(number):
        if number == 1:
            return 1

        return number + fact(number)

    f = fact(n)
    iterations = f - 1  # because first and last are always ( and )
    result = [["("] for _ in range(f)]

    for i in range(iterations):
        pass

    return result


for n, exp in [
    [0, [""]],
    [1, ["()"]],
    [2, ["(())", "()()"]],
    [3, ["((()))", "(()())", "(())()", "()(())", "()()()"]],
]:
    actual = balanced_parens(n)
    actual.sort()
    print(actual)
    assert actual == exp
