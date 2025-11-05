function [y, Hd] = filtro_pasabandas(x, fs, fband, metodo, orden)
Wn = fband/(fs/2);
switch lower(metodo)
    case 'butter'
        [b,a] = butter(orden, Wn, 'bandpass');
    case 'fir'
        b = fir1(orden, Wn, 'bandpass', hamming(orden+1)); a = 1;
end
try, y = filtfilt(b,a,x); catch, y = filter(b,a,x); end
Hd.b=b; Hd.a=a;
end
