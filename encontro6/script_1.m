% Encontro 6
% Professor: Bruno Bedo, PhD
% Objetivo da aula: An�lise de Dados na Plataforma de For�a (Salto)
% Objetivo do meu script:
%     1. Carregar arquivo
%     2. Filtrar o dados
%     3. Normalizar pelo tempo
%     4. Calcular a for�a m�xima de propulsao no solo
%     5. Exportar figura e resultados
warning off

%%%%%%%%%%%%%%%%%%%% In�cio %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Sujeitos: 
sbj = linspace(1,10,10);

% Frequencia de aquisi��o
freq = 1000; 

% Massa da participante
massa = 65; 

for i = 1:size(sbj,2)
%   Nome do arquivo
    file = ['data',num2str(i),'.xlsx'];
    caminho = ['dados/salto/',file];
    
%   Carregando arquivo
    data = import_forceplate_data(caminho);
    
%   Filtrando os dados 
    n = 4;
    Wn = 50/(freq/2); 
    [b,a]=butter(n,Wn); 
    dataF = filtfilt(b,a,data);

%   Calculating the resulting force 
    mag_vector = sqrt(sum(dataF(:,2:4).^2,2));

%   Detectando meio do sinal 
    PontCont = find(abs(diff(sign(mag_vector-20)))==2,4); 
    
%   Separando vetores
    vet1 = mag_vector(PontCont(1):PontCont(2),:);
    
%   Normalizando o dado
    VectNorm = timenormalize(vet1,1,size(vet1,1),100);
    
%   Calculando pelo peso corporal
    VectNorm = VectNorm./(massa*9.81); 

%   Results
    [max_force,local] = max(VectNorm);

%   Criando o vetor tempo 
    vtemp = linspace(1,100,100)'; 

%   Ploting FPRS
    f1 = figure(1); clf 
    plot(vtemp,VectNorm,'k'); 
    xlabel('0-100% Cycle'); ylabel('Force(B/W)')
    hold on
    plot(local,max_force,'ro','LineWidth',2)
    title({'For�a m�xima de propuls�o';[num2str(round(max_force,2)),' B/W']})

%   Dado resultado 
    result_forca(:,i) = VectNorm;
    
%   Pause para ver o gr�fico
%     pause(1)

end
% Fechando Figura 1
close(f1)

% Calculando o desvio padr�o
% Op��o 1
for i = 1:size(result_forca,1)
    datFsd(i,1) = std(result_forca(i,:));
end

% Op��o 2
% datFsd = result_forca' 
% datFsd = std(datFsd)'; 

% Calculando o m�ximo de cada coluna
max_columns = max(result_forca)'; 

% M�dia
datFm = mean(result_forca,2);

% Figura geral 
f1 = figure (1); clf; set(f1,'name','For�a de rea��o no solo')
shadedErrorBar(vtemp,datFm,datFsd,'lineprops',{'r','markerfacecolor','r'});
xlabel('0 a 100% Cycle');
ylabel('For�a(B/W)')
title ('For�a de rea��o no solo');
legend('CMJ - Force Plate')

% Exportando figura 
export_fig(f1,['dados/salto/ForcePlate_CMJ'],'-jpg','-transparent')

% Salvando em excel os resultados
restitle = ['results/FMax_Prop.xlsx']; 
sub = {'Subj1','Subj2','Subj3','Subj4','Subj5','Subj6','Subj7','Subj9','Subj9','Subj10'}';
xlswrite(restitle,sub,1,'A1')
xlswrite(restitle,max_columns,1,'B1')
e = actxserver('Excel.Application');

% Fim
disp('Done')
close all






