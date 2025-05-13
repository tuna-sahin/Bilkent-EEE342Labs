%% Question 1
clf;
w = logspace(-1,2,100);
for k = 1:100
    s = 1i * w(k);
    G(k) = 20 / (0.5*s+1);
end
semilogx(w,20*log10(abs(G)),'r',w,angle(G)*180/pi,'r--');
hold on
finesemilogx([0],[0],'Frequency Response','\omega','Y(j\omega)',[-1 2],[-90 40],'off',[400 400])
legend('Magnitude','Phase','','','','','')
grid on
%% Question 2
clf;
w = logspace(-1,2,100);
for k = 1:100
    s = 1i * w(k);
    G(k) = 20 / (0.5*s+1);
end
semilogx(w,20*log10(abs(G)),'r',w,angle(G)*180/pi,'r--');
hold on
w = logspace(-1,2,10);
sys = tf([20],[0.5 1]);
amp = w.*0;
phase = w.*0;
for i = 1:length(w)
    t = linspace(0,100,100001);
    r = cos(w(i)*t);
    x = lsim(sys,r,t);
    R = fft(r);
    [Kr,indexr] = max(abs(fft(r)));
    tempphase = angle(R(indexr));
    X = fft(x);
    [K,index] = max(abs(X));
    [Kr,indexr] = max(abs(R));
    amp(i) = K/Kr;
    phase(i) = angle(X(index)) - tempphase;
end
semilogx(w,20*log10(amp),'b*',w,phase*180/pi,'bx');
finesemilogx([0],[0],'Frequency Response','\omega','Y(j\omega)',[-1 2],[-90 40],'off',[400 400])
legend('Magnitude (Example)','Phase (Example)','Calculated Magnitude','Calculated Phase','','','','','','Location','east')
grid on