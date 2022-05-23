import string
import random

characters = list(string.ascii_letters + string.digits + "!@#$%^&*()")


def generate_random_password():
    length = 8

    random.shuffle(characters)

    password = []
    for i in range(length):
        password.append(random.choice(characters))

    random.shuffle(password)

    val = ("".join(password))
    fp = open("pass.txt", 'a')
    n = "\n"

    fp.write(val + n)

    fp.close()

    print(val)


count = 0
while count <= 5:
    generate_random_password()
    count += 1
