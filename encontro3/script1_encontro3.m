% Encontro 3
% Script 1
% Professor: Bruno Bedo
% Objetivo da aula: Controladores de fluxo (Estruturas condicionais)

criador_codigo = 'Bruno';
nome = 'Bruno'; 
idade = 27; 

% Comparar valores integrais (n�meros)
if idade >=18
    disp(' ')
    disp([nome, ' pode comprar uma cerveja.'])
    if idade >=30
        disp(' ')
        disp([nome,' nasceu em 1992 ou antes.'])
    else
        disp([nome,' nasceu depois de 1992.']) 
    end
end



% Comparar strings
% pergunta: O nome do criador do c�digo � o mesmo que o meu?

if strcmp(criador_codigo,nome)
    disp(' ')
    disp('O meu nome � igual ao do criador do c�digo')
else
    disp(' ')
    disp('O nome � diferente')
end

% a = 2; A recebe 2
% a == 2; A � igual a 2. 
% > 
% <
% >=
% <=

















