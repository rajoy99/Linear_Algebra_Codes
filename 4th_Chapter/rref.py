

from sympy.matrices import Matrix 
A= Matrix([[1,2,4],
        [3,9,21]])


print(A.rref()[0])