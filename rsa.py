import math
from sympy import isprime, mod_inverse

p = int(input("P : "))
if(not isprime(p)):
    print("P must be prime !")
    exit()

q = int(input("Q : "))
if(not isprime(q)):
    print("Q must be prime !")
    exit()

n = p*q
phi = (p-1)*(q-1)
e = 65537

if(e >= phi):
    for i in range(2, phi):
        if(math.gcd(i, phi) == 1):
            e = i
            break

print(f"E : {e}")
d = mod_inverse(e, phi)
print(f"Public key : ({e},{n})")
print(f"Private key : ({d},{n})")

pt = input("Enter message to encrypt : ")
pt = int.from_bytes(pt.encode('utf-8'), byteorder='big')

if(pt >= n):
    print("Message too large for key size !")
    exit()

ct = pow(pt, e, n)
print(f"Encrypted message(integer) : {ct}")

def int_to_string(num):
    byte_length = (num.bit_length() + 7) // 8
    return num.to_bytes(byte_length, byteorder='big').decode('utf-8')

pt = pow(ct, d, n)
print(f"Decrypted Message : {int_to_string(pt)}")



