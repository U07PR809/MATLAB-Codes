clear all
x0 =[0.1; 0.1; -0.1];

[x,f,ea,iter] = newtMult(@jacobianMatrix, x0, 1e-6, 100)