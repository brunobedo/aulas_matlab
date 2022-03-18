% Encontro 5 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Cria��o de gr�ficos
% Objetivo do meu script:
%     1. Salvando figuras de modo autom�tico

%%%%%%%%%%%%%%%%%%%% In�cio %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Carregar a minha base de dados 
load('data2d-Exemplo.mat');

% Frequencia de aquisi��o
freq = 30; 

% Plotando todos os atletas
for i = 1:size(data_x,2)
%   Criando figura 
    f = figure(i);clf
 
%   Dados
    xdata = data_x(:,i);
    ydata = data_y(:,i);
    
%   Criando vetor tempo
    vtemp = ((0:size(xdata,1)-1)/freq)./60';
   
%   Plot campo
    campo_grande
    
%   Plot
    hold on
    p = plot(xdata,ydata,'k','LineStyle',':','LineWidth',2); 
    xlabel('Comprimento')
    ylabel('Largura')
    title(['Deslocamento do atleta ',num2str(i)]);
    legend(p,'Deslocamento do atletas no campo')
    
%   Salvando figuras
%   Exemplo 1
%     saveas(f,['figures/DeslocamentoCampo_Atleta_',num2str(i),'.jpg'])

%   Exemplo 2
    export_fig figures/DeslocamentoCampo_Atleta_num2st- -tiff -transparent
end