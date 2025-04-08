from math import gcd
from sympy import isprime
from hashlib import sha256
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
message = input("Enter message to sign : ")
hash = sha256(message.encode()).hexdigest()
hash_int = int(hash,16)%n
sign = pow(hash_int,d,n)
print(f"Digital Signature : {sign}")
message_rec = input("Enter message to verify : ")
e_rec = int(input("Enter public key e : "))
n_rec = int(input("Enter public key n : "))
sign_rec = int(input("Enter digital signature : "))
hash_int_computed = int(sha256(message_rec.encode()).hexdigest(),16)%n_rec
hash_decrypted = pow(sign_rec,e_rec,n_rec)
if(hash_decrypted==hash_int_computed) :
    print("Digital signature verified")
else :
    print("Invalid digital signature !")
