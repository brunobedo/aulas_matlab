% Encontro 9
% Professor: Bruno Bedo, PhD
% Objetivo do meu script:
%     1. Create dialog box to gather user input 
%%%%%%%%%%%%%%%%%%%% In�cio %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Example 1 
% Obj: Calcular o IMC de um participante
defvalues = {'Jo�o', '56', '1.65'};
box = inputdlg({'Nome','Massa', 'Estatura'},'T�tulo da pergunta',...
                [1 20; 1 20; 1 20],defvalues); 
  
% Calculando o IMC
massa = str2double(box{2});
estat = str2double(box{3}); 

% Calculando o IMC
imc = massa/(estat^2); 

% Resultados
disp(['O IMC do(a) ', box{1}, ' � de ', num2str(imc)])