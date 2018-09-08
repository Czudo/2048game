function col = color(m)
%Funkcja ustalaj¹ca kolor poszczególnych wartoœci na planszy.
if m == 0
    a = [205,193,180];
elseif m == 2
    a = [238,228,219];
elseif m == 4
    a = [237,224,200];
elseif m == 8
    a = [245,167,126];
elseif m == 16
    a = [245,149,99];
elseif m == 32
    a = [246,124,95];
elseif m == 64
    a = [246,94,59];
elseif m == 128
    a = [237,207,114];
elseif m == 256
    a = [237,207,97];
elseif m == 512
    a = [237,200,80];
elseif m == 1024
    a = [237,197,63];
elseif m == 2048
    a = [237,194,46];
else 
    a = [0, 0, 0];
end
col=a./255;