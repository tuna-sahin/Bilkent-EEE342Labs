vel_1 = out.velocity;
plot(vel_1);
filewrite(vel_1.data,"slmcnm_part1");
plot(fileread("filtered_data"))
%%
simin = out.velocity;
%%
output_data = out.simin_out;
plot(output_data)
title("Filtered")
filewrite(output_data.data,'filtered_data')
y_values = output_data.data;
t_values = out.tout;
gain = round(mean(     y_values( round(0.2*length(y_values))  :end)   ))
position = 8;
tau = (-1*t_values(position)) / log(  (gain- y_values(position))/gain       )
filewrite([gain tau],'foaprox');
%%
t_approx = linspace(0,10,10001);
y_approx = gain - gain*exp(t_approx/(-1*tau));
plot(t_approx,y_approx)
title('aprox')
filewrite(y_approx,'bnamcnm_part2_aprox')
%%
sim_output = out.vel_sim;
plot(vel_1);
hold on;
plot(t_approx,y_approx)
title("on top"); 
legend('1','2')
filewrite(out.y.data,'ki=20kp')
%%
simdata = fileread("tuned_datası")
tsimdata = linspace(0,10,length(simdata))
plot(tsimdata,simdata,"LineWidth",1.5)
hold on
plot(out.velocity)
%%
filewrite(out.velocity.data,"part4")
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