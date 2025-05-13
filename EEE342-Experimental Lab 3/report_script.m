Gp=tf(conv([-90.79],[1 -200]),conv([1 6.26],[1 200]))
Gc=tf([0.137 11.03],[1 18.78 0])
OLTF = Gp*Gc
allmargin(OLTF)
%%
clf;
bode(OLTF)
%%
margin(OLTF)    

%%
subplot(5,1,1)
fineplot(linspace(0,10,1001),fileread('GM_step_K=1(stable)'),'Angular Velocity vs Time at K=1 (Stable)','t(sec)','Revolution(rpm)',[-0.2 11],[-10 110],'off',[400 400],'Stable','-');
grid on
subplot(5,1,2)
fineplot(linspace(0,10,1001),fileread('GM_step_K=1.25(stable)'),'Angular Velocity vs Time at K=1.25 (Stable)','t(sec)','Revolution(rpm)',[-0.2 11],[-10 110],'off',[400 400],'Stable','-');
grid on
subplot(5,1,3)
fineplot(linspace(0,10,1001),fileread('GM_step_K=1.29(stable)'),'Angular Velocity vs Time at K=1.29 (Marginally Stable)','t(sec)','Revolution(rpm)',[-0.2 11],[-10 110],'off',[400 400],'Stable','-');
grid on
subplot(5,1,4)
fineplot(linspace(0,10,1001),fileread('GM_step_K=1.31(unstable)'),'Angular Velocity vs Time at K=1.31 (Unstable)','t(sec)','Revolution(rpm)',[-0.2 11],[-10 110],'off',[400 400],'Stable','-');
grid on
subplot(5,1,5)
fineplot(linspace(0,10,1001),fileread('GM_step_K=2(unstable)'),'Angular Velocity vs Time at K=2 (Unstable)','t(sec)','Revolution(rpm)',[-0.2 11],[-30 350],'off',[400 400],'Stable','-');
grid on
%%
subplot(4,1,1)
fineplot(linspace(0,10,1001),fileread('DM_stem_delay=0.01(stable)'),'Angular Velocity vs Time at d=0.01 (Stable)','t(sec)','Revolution(rpm)',[-0.2 11],[-10 110],'off',[400 400],'Stable','-');
grid on
subplot(4,1,2)
fineplot(linspace(0,10,1001),fileread('DM_stem_delay=0.015(stable)'),'Angular Velocity vs Time at d=0.015 (Marginally Stable)','t(sec)','Revolution(rpm)',[-0.2 11],[-10 110],'off',[400 400],'Stable','-');
grid on
subplot(4,1,3)
fineplot(linspace(0,10,1001),fileread('DM_stem_delay=0.02(unstable)'),'Angular Velocity vs Time at d=0.02 (Unstable)','t(sec)','Revolution(rpm)',[-0.2 11],[-10 110],'off',[400 400],'Stable','-');
grid on
subplot(4,1,4)
fineplot(linspace(0,10,1001),fileread('DM_stem_delay=0.04(unstable)'),'Angular Velocity vs Time at d=0.04 (Unstable)','t(sec)','Revolution(rpm)',[-0.2 11],[-30 350],'off',[400 400],'Stable','-');
grid on
