w = logspace(-1,2,100);

for k = 1:100

    s = 1i * w(k);
    G(k) = 90.79 / (s + 6.26);
end

subplot(2,1,1)
semilogx(w,20*log10(abs(G)));
title("Magnitude");
grid on

subplot(2,1,2)
semilogx(w,angle(G)*180/pi);
title("Phase");
grid on

%%
vel_1 = out.velocity;
vel_100_0 = out.velocity;

plot(vel_1)
disp(vel_1.Time)
filewrite(vel_1.Time,"freq_100.0_t")
filewrite(vel_1.data,"freq_100.0_y")
%%
plot(vel_1);
title("Sinusoidal_Out_DcMotor","r");
hold on
t = linspace(0,10,1001);
y = (10*sin(t*100));
plot(t,y);
grid on
%%
clf;
w = logspace(-1,2,100);
y = (10*sin(t*100));
for k = 1:100

    s = 1i * w(k);
    G(k) = 90.79 / (s + 6.26);
end

vel1_fft= fft(vel_1.data);
[mag,i_Ar] = max(abs(vel1_fft))
phase_dummy = angle(vel1_fft(i_Ar))

y_fft= fft(y);
[mag_y,i_Ary] = max(abs(y_fft))
phase_y = angle(y_fft(i_Ar))
freq = 100;

mag = mag/mag_y
phase = phase_dummy - phase_y 

subplot(2,1,1)
semilogx(w,20*log10(abs(G)));
hold on
semilogx(freq,20*log10(abs(mag)),'x')
title("Magnitude");
grid on

subplot(2,1,2)
semilogx(w,angle(G)*180/pi);
hold on
semilogx(freq,phase*180/pi,'x');
title("Phase");
grid on
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
    G_delay(k) = (90.79*(s-200)) / ((s + 6.26)*(s+200));
end

w_exp = [0.1 0.3 1 3 10 30 100];
dur = [70 70 25 25 10 10 10]
waves = [vel_0_1 vel_0_3 vel_1_0 vel_3_0 vel_10_0 vel_30_0 vel_100_0]

mags = w_exp.*0;
phases = mags;
for i = 1:length(w_exp)
    waves(i)
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
semilogx(w,20*log10(abs(G)));
hold on
semilogx(w_exp,20*log10(abs(mags)),'x')
finesemilogx(w,20*log10(abs(G_delay)),'off','Magnitude','\omega (rad/s)','|Y(j\omega)|',[-1 2],[-50 40],'off',[400 400],'Delayed Approximate Transfer Function')
grid on
subplot(2,1,2)
p1 = semilogx(w,angle(G)*180/pi,'DisplayName','Approximate Transfer Function');
hold on
p2 = semilogx(w_exp,phases*180/pi,'x','DisplayName','DC Motor Readings');
p3 = finesemilogx(w,angle(G_delay)*180/pi-180,'off','Phase','\omega (rad/s)','\angle Y(j\omega)',[-1 2],[30 -150],'off',[400 400],'Delayed Approximate Transfer Function');
legend([p1 p2 p3],'Location','southwest')
grid on




%%
function xread = fileread(name)
    filename = append(name,'.txt');
    % open your file for reading
    file1 = fopen(filename,'r');
    % write the matrix
    xread = fscanf(file1,'%f\n');
    % close the file
    fclose(file1);
end 

function filewrite(x,name)
    filename = append(name,'.txt');
    % open your file for writing
    file1 = fopen(filename,'wt');
    % write the matrix
    fprintf(file1,'%f\n',x);
    % close the file
    fclose(file1);
end