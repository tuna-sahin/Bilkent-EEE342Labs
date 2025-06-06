%%Question 1 Graph
clf;
w = logspace(-1,2,100);
for k = 1:100

    s = 1i * w(k);
    G(k) = 90.79 / (s + 6.26);
end

finesemilogx(0,0,'off',{'Approximate Transfer Function','Frequency Response Bode Plot'},'\omega (rad/s)    .','Y(j\omega)',[-1 2],[-90 30],'on',[400 400],'Magnitude','r-');
b1 = semilogx(w,20*log10(abs(G)),'r-','DisplayName','Magnitude (V)');
b2 = semilogx(w,angle(G)*180/pi,'r--','DisplayName','Phase (deg)');
legend([b1 b2],'Location','southwest')
grid on
exportgraphics(gcf,'q1bode.jpg')
%% First sinusoidal and its graph
clf;
t = linspace(0,70,7001);
y = 10*sin(t*0.1);
s2 = fineplot(t,y,{'Voltage vs Time',' for \omega = 0.1'},'t (sec)','y(t) (V)',[0 80],[-80 80],'on',[250 250],'Input','k-');
s1 = plot(vel_0_1,'DisplayName','Output','LineWidth',3);
legend([s2 s1])
exportgraphics(gcf,'q2sin.jpg')
%% Sinusoidals and their Graphs 
clf;
w_exp = [0.1 0.3 1 3 10 30 100];
dur = [70 70 25 25 10 10 10];
waves = [vel_0_1 vel_0_3 vel_1_0 vel_3_0 vel_10_0 vel_30_0 vel_100_0];
yboundary = [100 100 90 75 50 30 15];
divisions = {[1],[2],[3:4],[5:6],[7:8],[9:12],[13:16]};
xboundary = [90 90 35 35 12 14 14];
for i = 1: length(w_exp)
    subplot(4,4,divisions{i})
    t = linspace(0,dur(i),100*dur(i)+1);
    y = 10*sin(t*w_exp(i));
    %plot(waves(i),'b-')
    hold on
    grid on
    fineplot(t,y,{'Voltage vs Time',strcat('for \omega=',num2str(w_exp(i)))},'.   t (sec)','y(t) (V)',[0 xboundary(i)],[-1*yboundary(i) yboundary(i)],'on',[2000 2000],'','k-');
    plot(waves(i),'b-')
end
exportgraphics(gcf,'all_sin.jpg')
%% Question 2 Graph
clf;
w = logspace(-1,2,100);
y = (10*sin(t*100));
for k = 1:100

    s = 1i * w(k);
    G(k) = 90.79 / (s + 6.26);
end

w_exp = [0.1];
dur = [70];
waves = [vel_0_1];

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
m2=finesemilogx(w,20*log10(abs(G)),'off','Magnitude vs Angular Frequency','\omega (rad/s)       .','|Y(j\omega)| (V)    ',[-1 2],[0 40],'off',[600 1200],'Approximate Transfer Function','k-');
grid on
legend([m1 m2],'Location','southwest')
subplot(2,1,2)
p1 = semilogx(w_exp,phases*180/pi,'x','DisplayName','DC Motor Readings','MarkerSize',8,'LineWidth',2);
hold on
p2 = finesemilogx(w,angle(G)*180/pi,'off','Phase vs Angular Frequency','\omega (rad/s)','\angle Y(j\omega) (deg)',[-1 2],[30 -100],'off',[600 1200],'Approximate Transfer Function','k-');
legend([p1 p2],'Location','southwest')
grid on
exportgraphics(gcf,'q2bode.jpg')
%% Question 3 Graph
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
m2=finesemilogx(w,20*log10(abs(G)),'off','Magnitude vs Angular Frequency','\omega (rad/s)','|Y(j\omega)| (V)',[-1 2],[-15 40],'off',[600 1200],'Approximate Transfer Function','k-');
grid on 
legend([m1 m2],'Location','southwest')
subplot(2,1,2)
p1 = semilogx(w_exp,phases*180/pi,'x','DisplayName','DC Motor Readings','MarkerSize',8,'LineWidth',2);
hold on
p2 = finesemilogx(w,angle(G)*180/pi,'off','Phase vs Angular Frequency','\omega (rad/s)','\angle Y(j\omega) (deg)',[-1 2],[30 -150],'off',[600 1200],'Approximate Transfer Function','k-');
legend([p1 p2],'Location','southwest')
grid on
exportgraphics(gcf,'q3bode.jpg')
%% Question 4 Graph
clf;
w = logspace(-1,2,100);
y = (10*sin(t*100));
for k = 1:100

    s = 1i * w(k);
    G(k) = 90.79 / (s + 6.26);
end

for k = 1:100
    s = 1i * w(k);
    G_delay(k) = -1* ((90.79*(s-200)) / ((s + 6.26)*(s+200)));
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
m1=semilogx(w,20*log10(abs(G_delay)),'--','DisplayName','Delayed Approximate Transfer Function','LineWidth',3);
hold on
m2=semilogx(w_exp,20*log10(abs(mags)),'x','DisplayName','DC Motor Readings','MarkerSize',8,'LineWidth',2);
m3=finesemilogx(w,20*log10(abs(G)),'off','Magnitude vs Angular Frequency','\omega (rad/s)','|Y(j\omega)| (V)',[-1 2],[-15 40],'off',[600 1200],'Approximate Transfer Function','k-');
grid on
legend([m1 m2 m3],'Location','northwest')
subplot(2,1,2)
p1 = semilogx(w,angle(G_delay)*180/pi,'--','DisplayName','Delayed Approximate Transfer Function','LineWidth',3);
hold on
p2 = semilogx(w_exp,phases*180/pi,'x','DisplayName','DC Motor Readings','MarkerSize',8,'LineWidth',2);
p3 = finesemilogx(w,angle(G)*180/pi,'off','Phase vs Angular Frequency','\omega (rad/s)','\angle Y(j\omega) (deg)',[-1 2],[20 -200],'off',[600 1200],'Approximate Transfer Function','k-');
legend([p1 p2 p3],'Location','southwest')
grid on
exportgraphics(gcf,'q4bode.jpg')