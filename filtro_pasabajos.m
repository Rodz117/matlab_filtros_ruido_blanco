function [y, Hd] = filtro_pasabajos(x, fs, fc, metodo, orden)
Wn = fc/(fs/2);
switch lower(metodo)
    case 'butter'
        [b,a] = butter(orden, Wn, 'low');
    case 'fir'
        b = fir1(orden, Wn, hamming(orden+1), 'low'); a = 1;
end
try, y = filtfilt(b,a,x); catch, y = filter(b,a,x); end
Hd.b=b; Hd.a=a;
end
