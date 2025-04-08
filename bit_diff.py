from hashlib import sha256
m1 = input("Enter message 1 : ")
m2 = input("Enter message 2 : ")
h1 = int(sha256(m1.encode()).hexdigest(),16)
h2 = int(sha256(m2.encode()).hexdigest(),16)
bin1 = format(h1,'0256b')
bin2 = format(h2,'0256b')
bit_diff = sum(b1!=b2 for b1,b2 in zip(bin1,bin2))
print(f"Bit Diff : {bit_diff}")