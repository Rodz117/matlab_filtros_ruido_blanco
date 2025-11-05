function [y, Hd] = filtro_pasaaltos(x, fs, fc, metodo, orden)
Wn = fc/(fs/2);
switch lower(metodo)
    case 'butter'
        [b,a] = butter(orden, Wn, 'high');
    case 'fir'
        b = fir1(orden, Wn, hamming(orden+1), 'high'); a = 1;
end
try, y = filtfilt(b,a,x); catch, y = filter(b,a,x); end
Hd.b=b; Hd.a=a;
end
