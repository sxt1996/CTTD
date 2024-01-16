function [auc] = ROC(mask,r,type)   
anomaly_map = logical(double(mask)==1); 
normal_map = logical(double(mask)==0);            

r_max = max(r(:));     
taus1 = linspace(0, r_max, 2000);      

for index = 1:length(taus1)                  
  tau = taus1(index);           
  judge = (r > tau);            
  PF(index) = sum(judge & normal_map)/sum(normal_map);    
  PD(index) = sum(judge & anomaly_map)/sum(anomaly_map);   
end

plot(PF, PD,'color', type  , 'LineWidth', 3);   grid on   
xlabel('False Alarm Rate');    
ylabel('Probability of Detection');      
axis([0 0.1 0 1])

auc =  sum((PF(1:end-1)-PF(2:end)).*(PD(2:end)+PD(1:end-1))/2);

end