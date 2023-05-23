function y = Detyra3b (I)
% KY FUNKSION NUK E BEN PASTRIMIN PER QFARDO ZHURME DHE QFARDO IMAZHI
% VETEM PER DETYREN 3b PER ZHURMEN E DHENE DHE PER IMAZHIN lena.tif
% ESHTE VENDOSUR NE FORM FUNKSIONI PER ORGANIZIM ME TE MIRE

% Ne fillim marrim gjatesine dhe gjeresine e I-s
[M,N]=size(I);
% Krijojme matricen A e cila do te mbaje zhurmen periodike
A = zeros(M,N);
for i=1:M
for j=1:N
  % Mbushja e A-se
  A(i,j)=(20*cos((pi*i)/3 + (pi*j)/7))+(23*sin((pi*i)/3 + (pi*j)/8));
end
end
% Mbledhim I dhe A, ashtu qe te krijojme imazh me zhurme
B = I + A;
% Fillojme transformimet furie
FTB = fft2(B);
FTBSH=fftshift(FTB);
% Pasi qe identifiokjme zhurmat krijojme masken qe ben eliminimin e saj
% Ne fillim krijohet maska e mbushur me 1
F = ones(M,N);
% pastaj heqim (bejme 0) pjeset ku jane zhurmat
F(85:88, 110:114) = 0;
F(171:173, 144:148) = 0;
% Konbinojme masken me imazhin e modifikuar me tf
C1 = FTBSH .* F;
% Bejme transformimet inverse
C2 = ifftshift(C1);
C3 = ifft2(C2);
% Marrim pjesen reale te imazhit final
Final = uint8(real(C3));
% shfaqim te gjitha imazhet qe nevojitet per spjegimin e funksionit
% Sipas rradhes : imazhi origjinal, imazhi me zhurme, imazhi ku duhet te shihen zhurmat, imazhi final
imshow(I), figure, imshow(B), figure, imshow(log(abs(FTBSH)),[]), figure, imshow(F), figure, imshow(Final);
endfunction
