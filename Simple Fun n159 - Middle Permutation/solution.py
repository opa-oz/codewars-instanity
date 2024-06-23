def middle_permutation(string):
    chars = list(string)
    chars.sort()

    length = len(chars)

    if length <= 2:
        return "".join(chars)

    if length % 2 == 0:
        mid = int(length / 2 - 1)
        rest = chars[0:mid] + chars[mid + 1 :]
        res = chars[mid] + "".join(list(reversed(rest)))
        return res

    mid = int(length / 2)
    rest = chars[0:mid] + chars[mid + 1 :]
    res = chars[mid] + middle_permutation("".join(rest))
    return res


assert middle_permutation("abc") == "bac"
assert middle_permutation("abcd") == "bdca"
assert middle_permutation("abcdx") == "cbxda"
assert middle_permutation("abcdxg") == "cxgdba"
assert middle_permutation("abcdxgz") == "dczxgba"
