from math import gcd
from sympy import isprime
p = int(input("Enter large prime p : "))
q = int(input("Enter large prime q : "))
while not isprime(p) :
    print("Not prime !")
    p = int(input("Enter large prime p : "))
while not isprime(q) :
    print("Not prime !")
    q = int(input("Enter large prime q : "))
n = p*q
phi = (p-1)*(q-1)
e = int(input("Enter starting range for e : "))
for i in range(e,phi) :
    if(gcd(i,phi)==1) :
        e = i
        break
print(f"Public Key : ({e},{n})")
d = pow(e,-1,phi)
print(f"Private Key : ({d},{n})")
plainText = int(input("Enter message(numeric) to encrypt : "))
cipherText = pow(plainText,e,n)
print(f"Encrypted text : {cipherText}")
plainText = pow(cipherText,d,n)
print(f"Decrypted text : {plainText}")