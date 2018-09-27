% x=linspace(0,2*pi,100);
% plot(x,sin(x),x,2*sin(x),x,3*sin(x));
uniform = [24.54,29.28,32.77,53.72];
seqdpp = [24.87,29.76,33.52,48.43];
reseqdpp = [26.98,32.09,35.94,48.93];
redseqdpp = [27.75,33.45,36.72,49.41];
seqdpp_5 = [24.67,29.36,33.22,48.23];
seqdpp_12 = [24.03,29.46,32.97,48.08];
dpplstm = [18.54,22.92,26.15,47.02];
x = [8,12,16,20];
strain_image = plot(x,redseqdpp,'ks-',x,reseqdpp,'b>-',x,seqdpp_5,'m+:',x,seqdpp,'ro--',x,seqdpp_12,'gd--',x,uniform,'cx-.',x,dpplstm,'k*:');
ylabel('F-measure (%)');
legend('DySeqDPP','Reinforce SeqDPP','SeqDPP (5-shot segment)','SeqDPP (10-shot segment)','SeqDPP (12-shot segment)','Uniform','dppLSTM');

set(gca,'XTick',[8:4:20]);
set(gca, 'XTicklabel',{'K=8','K=12','K=16','K=\infty'}); 
% axis tight;
%set (gcf,'Position',[0,0,500,500]);
saveas(gca,'matcurvenospace.bmp','bmp');