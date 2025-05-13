simin = [t  y];
fineplot(t,y,'Raw Data','t','y(t)',[-1 10],[-5 100],'off',[400 400])

y_array = out.y_out.Data;
average = (mean(y_array(length(round(y_array*0.2)):end)))


%lets choose the array index 310 arbitrarily
indice = 500
tau = -out.tout(indice)/log((average-y_array(indice))/average)

t2 = linspace(0,10,100001);
y2 = average - (average * exp(-t2/tau));
subplot(1,1,1)
hold off
plot(t2,y2)
hold on
%plot(out.tout,y_array)

fineplot(out.tout.',y_array,'Title','t','y(t)',[-1 10],[-5 100],'off',[400 400])
