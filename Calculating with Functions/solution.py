def zero(func=None):
    if func is not None:
        return func(0)

    return 0


def one(func=None):
    if func is not None:
        return func(1)

    return 1


def two(func=None):
    if func is not None:
        return func(2)

    return 2


def three(func=None):
    if func is not None:
        return func(3)

    return 3


def four(func=None):
    if func is not None:
        return func(4)

    return 4


def five(func=None):
    if func is not None:
        return func(5)

    return 5


def six(func=None):
    if func is not None:
        return func(6)

    return 6


def seven(func=None):
    if func is not None:
        return func(7)

    return 7


def eight(func=None):
    if func is not None:
        return func(8)

    return 8


def nine(func=None):
    if func is not None:
        return func(9)

    return 9


def plus(number):
    return lambda x: x + number


def minus(number):
    return lambda x: x - number


def times(number):
    return lambda x: x * number


def divided_by(number):
    return lambda x: int(x / number)


assert seven(times(five())) == 35
assert four(plus(nine())) == 13
assert eight(minus(three())) == 5
assert six(divided_by(two())) == 3
