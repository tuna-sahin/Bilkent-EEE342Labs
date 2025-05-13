Gp=tf(conv([-90.79],[1 -200]),conv([1 6.26],[1 200]))
Gc=tf([0.137 11.03],[1 18.78 0])
OLTF = Gp*Gc
bode(OLTF)
margin(OLTF)    
allmargin(OLTF)
%%
clf;
data = (reshape(velocity.data(1,1,1:end),[1001 1]))
plot(data)
%%
filewrite(data,'DM_stem_delay=0.015(stable)')
%%
clf;
subplot(3,1,1)
plot(fileread('DM_stem_delay=0.01(stable)'))
title('K=0.001')
subplot(3,1,2)
plot(fileread('DM_stem_delay=0.015(stable)'))
title('d=0.015')
subplot(3,1,3)
plot(fileread('DM_stem_delay=0.02(unstable)'))
title('K=0.002')
%%


%%

function filewrite(x,name)
 filename = append(name,'.txt');
 % open your file for writing
 file1 = fopen(filename,'wt');
 % write the matrix
 fprintf(file1,'%f\n',x');
 % close the file
 fclose(file1);
end
function xread = fileread(name)
 filename = append(name,'.txt');
 % open your file for reading
 file1 = fopen(filename,'r');
 % write the matrix
 xread = fscanf(file1,'%f\n');
 % close the file
 fclose(file1);
end 