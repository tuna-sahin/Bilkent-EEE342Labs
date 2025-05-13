clf;
w = logspace(-1,2,100);
y = (10*sin(t*100));
for k = 1:100

    s = 1i * w(k);
    G(k) = 90.79 / (s + 6.26);
end

w_exp = [0.1 0.3 1 3 10 30 100];
dur = [70 70 25 25 10 10 10];
waves = [vel_0_1 vel_0_3 vel_1_0 vel_3_0 vel_10_0 vel_30_0 vel_100_0];

mags = w_exp.*0;
phases = mags;
for i = 1:length(w_exp)
    vel1_fft= fft(waves(i).data);
    [mag,i_Ar] = max(abs(vel1_fft));
    phase_dummy = angle(vel1_fft(i_Ar));
    
    y = 10*sin(linspace(0,dur(i),100*dur(i)+1).*w_exp(i));
    y_fft= fft(y);
    [mag_y,i_Ary] = max(abs(y_fft));
    phase_y = angle(y_fft(i_Ar));
    freq = 100;
    
    mag = mag/mag_y;
    phase = mod(phase_dummy - phase_y,2*pi)-2*pi;

    mags(i) = mag;
    phases(i) = phase;
end
subplot(2,1,1)
m1=semilogx(w_exp,20*log10(abs(mags)),'x','DisplayName','DC Motor Readings','MarkerSize',8,'LineWidth',2);
hold on
m2=finesemilogx(w,20*log10(abs(G)),'off','Magnitude vs Angular Frequency','\omega (rad/s)','|Y(j\omega)| (V)',[-1 2],[-20 40],'off',[600 1200],'Approximate Transfer Function','k-');
grid on 
legend([m1 m2],'Location','southwest')
subplot(2,1,2)
p1 = semilogx(w_exp,phases*180/pi,'x','DisplayName','DC Motor Readings','MarkerSize',8,'LineWidth',2);
hold on
p2 = finesemilogx(w,angle(G)*180/pi,'off','Phase vs Angular Frequency','\omega (rad/s)','\angle Y(j\omega) (deg)',[-1 2],[30 -150],'off',[600 1200],'Approximate Transfer Function','k-');
legend([p1 p2],'Location','southwest')
grid on