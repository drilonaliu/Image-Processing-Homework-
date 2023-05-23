function y = Detyra3c (I, d0, u0, v0)
% Njehere marrim madhesine dhe gjeresin e imazhit origjinal dhe krijojme nje matrice boshe
[M,N] = size(I);
for i=1:M
for j=1:N
  A(i,j) = 1 - exp((-1/2)*((sqrt((i - (M/2) - u0)^2+(j - (N/2) - v0)^2)*sqrt((i - (M/2) + u0)^2+(j - (N/2) + v0)^2))/(d0^2)));
end
end
y=A;
endfunction
