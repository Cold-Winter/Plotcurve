% x=linspace(0,2*pi,100);
% plot(x,sin(x),x,2*sin(x),x,3*sin(x));
uniform = [24.54,29.28,32.77,53.72];
seqdpp = [24.87,29.76,33.52,48.43];
reseqdpp = [26.98,32.09,35.94,48.93];
redseqdpp = [27.75,33.45,36.72,49.41];
seqdpp_5 = [24.67,29.36,33.22,48.23];
seqdpp_12 = [24.03,29.46,32.97,48.08];
dpplstm = [18.54,22.92,26.15,47.02];


saprunstep = [0, 0.45135135135135135, 0.8810810810810811, 0.9621621621621622, 0.981081081081081, 0.9900900900900901, 0.9954954954954955, 0.9972972972972973, 0.9981981981981982, 0.9981981981981982, 0.9990990990990991, 1.0, 1.0, 1.0];
robuststep = [0, 0.8012729068363876, 0.967299462306595, 0.986722264896302, 0.9936354658180621, 0.995830132777351, 0.9971469329529244, 0.9982442664325688, 0.9989026665203555, 0.9993415999122133, 0.9995610666081423, 0.9996707999561066, 0.9998902666520355, 1.0];
thermstep = [0, 0.15452653485952134, 0.3928199791883455, 0.5936524453694069, 0.7216441207075962, 0.8002081165452654, 0.8465140478668054, 0.8829344432882414, 0.913111342351717, 0.9427679500520292, 0.9640998959417274, 0.9786680541103018, 0.9932362122788762, 0.9984391259105099];
encoding = [0, 0.6738197424892703, 0.9066523605150214, 0.9638769670958512, 0.9810443490701002, 0.9892703862660944, 0.994277539341917, 0.9953505007153076, 0.9964234620886981, 0.9974964234620887, 0.9985693848354793, 0.9989270386266095, 0.9992846924177397, 1.0];
%cascade = [0, 0.9386075066275987, 0.9732105483465885, 0.9829775359285614, 0.9884191432956607, 0.991628296358309, 0.9934421654806753, 0.9953955629970699, 0.9960932049672109, 0.9970699037254082, 0.9981861308776336, 0.9983256592716618, 0.9994418864238873, 0.9998604716059718];
lid = [0, 0.9691856199559794, 0.9933969185619956, 0.9955979457079971, 0.9977989728539985, 0.9985326485693323, 0.9985326485693323, 0.9992663242846662, 0.9992663242846662, 0.9992663242846662, 0.9992663242846662, 0.9992663242846662, 0.9992663242846662, 1.0];
cascade = [0, 0.36886993603411516, 0.5970149253731343, 0.7569296375266524, 0.8230277185501066, 0.8656716417910447, 0.8955223880597015, 0.9211087420042644, 0.9445628997867804, 0.9530916844349681, 0.9658848614072495, 0.976545842217484, 0.9850746268656716, 1.0];
std = [0, 0.9991666666666666, 0.9995833333333334, 0.9995833333333334, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
adv_bnn = [0, 0.47474747474747475, 0.7525252525252525, 0.8333333333333334, 0.8585858585858586, 0.8888888888888888, 0.9393939393939394, 0.9444444444444444, 0.9646464646464646, 0.9747474747474747, 0.9797979797979798, 0.98989898989899, 0.98989898989899, 1.0];
adv_train = [0, 0.5117845117845118, 0.7272727272727273, 0.8653198653198653, 0.9191919191919192, 0.9427609427609428, 0.9562289562289562, 0.9730639730639731, 0.9797979797979798, 0.9932659932659933, 1.0, 1.0, 1.0, 1.0];

x = [0:30:400];
% strain_image = plot(x,redseqdpp,'ks-',x,reseqdpp,'b>-',x,seqdpp_5,'m+:',x,seqdpp,'ro--',x,seqdpp_12,'gd--',x,uniform,'cx-.',x,dpplstm,'k*:');
strain_image = plot(x,adv_train*0.479,'b*:',x,adv_bnn*0.753,'k<--',x,thermstep*0.91,'m+:',x,cascade*0.977,'gd--',x,lid,'cx-.',x,encoding,'ro--',x,saprunstep,'ks-',x,robuststep,'b>-',x,std,'k*:');

ylabel('Attack success Rate %');
xlabel('Number of iterations T');
legend('ADV-TRAIN','ADV-BNN','THERM-ADV','CAS-ADV','LID','THERM','SAP','RSE','VANILLA-1');

set(gca,'XTick',[0:30:400]);
% set(gca, 'XTicklabel',{'K=8','K=12','K=16','K=\infty'}); 
% axis tight;
%set (gcf,'Position',[0,0,500,500]);
saveas(gca,'matcurvenospace.bmp','bmp');