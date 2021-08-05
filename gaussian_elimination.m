clc
A=[10 -7 0;-3 2.099 6;5 -1 5]
b=[7;3.901;6]
[n,~]=size(A);
t=zeros(n,n);
y=zeros(n,1);
x=zeros(n,1);

for i=1:n-1
  for j=i+1:n
    if abs(A(j,i))>abs(A(i,i))
      t=A(j,:);
      A(j,:)=A(i,:);
      A(i,:)=t;
      
      y=b(j,:);
      b(j,:)=b(i,:);
      b(i,:)=y
    end
  end
end





for i=1:n-1
  m=A(i+1:n,i)/A(i,i);
  A(i+1:n,:)=A(i+1:n,:)-m*A(i,:);
  b(i+1:n,:)=b(i+1:n,:)-m*b(i,:);
  
endfor

x(n,:)=b(n,:)/A(n,n); %  z value 

for i=n-1:-1:1
  
  x(i,:)=(b(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
  
endfor
  
printf("%.5f \n",x);