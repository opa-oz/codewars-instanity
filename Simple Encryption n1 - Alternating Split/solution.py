def decrypt(encrypted_text, n):
    if encrypted_text is None:
        return None

    if n == 0:
        return encrypted_text

    half_len = int(len(encrypted_text) / 2)
    for iteration in range(n):
        odd = list(encrypted_text[0:half_len])  # split()
        even = list(encrypted_text[half_len:])  # split()

        result = []

        for i in range(len(encrypted_text)):
            if i % 2 == 0:
                if len(even) > 0:
                    result.append(even.pop(0))
            else:
                if len(odd) > 0:
                    result.append(odd.pop(0))

        encrypted_text = "".join(result)

    return encrypted_text


def encrypt(text, n):
    if text is None:
        return None

    if n == 0:
        return text

    for iteration in range(n):
        odd = []
        even = []

        for i in range(len(text)):
            if i % 2 == 0:
                even.append(text[i])
            else:
                odd.append(text[i])

        text = "".join(odd) + "".join(even)

    return text


assert encrypt("This is a test!", 0) == "This is a test!"
assert encrypt("This is a test!", 1) == "hsi  etTi sats!"
assert encrypt("This is a test!", 2) == "s eT ashi tist!"
assert encrypt("This is a test!", 3) == " Tah itse sits!"
assert encrypt("This is a test!", 4) == "This is a test!"
assert encrypt("This is a test!", -1) == "This is a test!"
# pylint: disable=line-too-long
assert encrypt("This kata is very interesting!", 1) == "hskt svr neetn!Ti aai eyitrsig"

assert decrypt("This is a test!", 0) == "This is a test!"
assert decrypt("hsi  etTi sats!", 1) == "This is a test!"
assert decrypt("s eT ashi tist!", 2) == "This is a test!"
assert decrypt(" Tah itse sits!", 3) == "This is a test!"
assert decrypt("This is a test!", 4) == "This is a test!"
assert decrypt("This is a test!", -1) == "This is a test!"
assert decrypt("hskt svr neetn!Ti aai eyitrsig", 1) == "This kata is very interesting!"

assert encrypt("", 0) == ""
assert decrypt("", 0) == ""
assert encrypt(None, 0) is None
assert decrypt(None, 0) is None
