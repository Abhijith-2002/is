import math
from sympy import isprime, mod_inverse,randprime
from hashlib import sha256

bits = 512
lb = 2**(bits-1)
ub = 2**(bits)
p = randprime(lb,ub)
q = randprime(lb,ub)
print(f"Large prime P generated : {p}")
print(f"Large prime Q generated : {q}")

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

message = input("Enter message to sign : ")
hash_val = int(sha256(message.encode('utf-8')).hexdigest(),16)
print(f"Hash Original : {hash_val}")
sign = pow(hash_val,d,n)
print(f"Digital Signature : {sign}")

decrypted_hash = pow(sign,e,n)
print(f"Hash Decrypted : {decrypted_hash}")

message_rec = input("Enter message to verify : ")

hash_val_computed = int(sha256(message_rec.encode('utf-8')).hexdigest(),16)
print(f"Hash Computed : {hash_val_computed}")

if(decrypted_hash==hash_val_computed) :
    print("Digital Signature Verified !")
else :
    print("Digital Signature Not Verified !")
