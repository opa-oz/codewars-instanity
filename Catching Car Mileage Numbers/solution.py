import re


def digit_and_zeros(s):
    return re.match(r"[1-9]0{2,}", s) is not None


def same_digit(s):
    if len(s) < 3:
        return False
    digit = s[0]
    for l in s:
        if l != digit:
            return False

    return True


def incremental(s):
    if len(s) < 3:
        return False
    digits = [int(l) for l in s]
    curr = digits[0]

    for i in range(1, len(s)):
        v = digits[i]
        if curr == 0 and v > 0:
            return False
        if (curr == 9 and v == 0) or v == curr + 1:
            curr = v
        else:
            return False

    return True


def decremental(s):
    if len(s) < 3:
        return False
    digits = [int(l) for l in s]
    curr = digits[0]

    for i in range(1, len(s)):
        v = digits[i]
        if v == curr - 1:
            curr = v
        else:
            return False

    return True


def is_palindrome(s):
    if len(s) < 3:
        return False
    for i in range(len(s) // 2):
        if s[i] != s[len(s) - 1 - i]:
            return False

    return True


def is_interesting(number, awesome_phrases):
    to_check = [number, number + 1, number + 2]

    for n in to_check:
        if n in awesome_phrases:
            if n == number:
                return 2

            return 1

    for n in to_check:
        v = str(n)
        if (
            digit_and_zeros(v)
            or same_digit(v)
            or incremental(v)
            or decremental(v)
            or is_palindrome(v)
        ):
            if n == number:
                return 2

            return 1

    return 0


tests = [
    {"n": 3, "interesting": [1337, 256], "expected": 0},
    {"n": 1336, "interesting": [1337, 256], "expected": 1},
    {"n": 1337, "interesting": [1337, 256], "expected": 2},
    {"n": 11208, "interesting": [1337, 256], "expected": 0},
    {"n": 11209, "interesting": [1337, 256], "expected": 1},
    {"n": 11211, "interesting": [1337, 256], "expected": 2},
]
for t in tests:
    assert is_interesting(t["n"], t["interesting"]) == t["expected"]
