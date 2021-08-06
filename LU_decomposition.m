A=[25 5 1;64 8 1;144 12 1];
b=[106.8;177.2;279.2];
[n,~]=size(A);

U=zeros(n,n);
L=zeros(n,n);
x=zeros(n,1);
y=zeros(n,1);

f=zeros(n,1);

for i=1:n-1
  m=A(i+1:n,i)/A(i,i);  % No phase change for pivot
  A(i+1:n,:)=A(i+1:n,:)-m*A(i,:);
  b(i+1:n,:)=A(i+1:n,:)-m*A(i,:);
  f(i+1:n,i)=m;
endfor

L=f;
for i=1:n
  L(i,i)=1;
endfor

y(1,:)=b(1,:)/L(1,1);

for i=2:n
  y(i,:)=(b(i,:)-L(i,i+1:n)*x(i+1:n))/L(i,i);
endfor
L
y

x(n,:)=y(n,:)/U(n,n);

for i=n-1:-1:1
  x(i,:)=(y(i,:)-U(i,i+1:n)*y(i+1:n))/U(i,i);
endfor

x