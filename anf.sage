import re
from sage.crypto.boolean_function import BooleanFunction

def make_B(size):
    return [(x + y) & (0b1 << (size - 1)) for x in xrange(2 ** size) for y in xrange(2 ** size)]

def fix_index(bit, i):
    if i < bit:
        return 'a' + str(i + 1)
    else:
        return 'b' + str(i - bit + 1)

bit = 2
B = BooleanFunction(make_B(bit))
P = B.algebraic_normal_form()
(P.degree(), re.sub(r'x\d+', lambda m:fix_index(bit, int(m.group()[1:])), str(P)))