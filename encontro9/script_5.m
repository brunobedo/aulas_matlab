% Encontro 9
% Professor: Bruno Bedo, PhD
% Objetivo do meu script:
%     1. Carregando e tratando todos os arquivos
%%%%%%%%%%%%%%%%%%%% In�cio %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all

% Selecionando quais arquivos devem ser carregados
d = dir('data');
fn = {d.name};
[indx,tf] = listdlg('PromptString',{'Select a file.',...
    'Selecione quantos arquivos voc� desejar.',''},...
    'ListString',fn(3:end));


% Colocar as informa��es do nosso participante
defvalues = {'Bruno', '30', 'Destro','Les�o na f�bula'};
box = inputdlg({'Nome','Idade', 'MMII Dominante', 'Hist�rico de les�o'},'T�tulo da pergunta',...
                [1 20; 1 20; 1 20; 1 20],defvalues); 

% Carregar os arquivos 
for subj = 1:size(indx,2)
    select =indx(subj); 
    
    file_name = fn(select+2);
    
    full_file = ['data/',char(file_name)];
    
%   Raw data
    T = readtable(full_file); 
    raw_data = table2array(T);
    raw_data = str2double(raw_data(2:end,:));
    
%   Time normalize
    dataNorm = timenormalize(raw_data,1,size(raw_data,1),100);

%   knee
    data.right.knee.x(:,subj) = dataNorm(:,11); 
    data.right.knee.y(:,subj) = dataNorm(:,12);
    data.right.knee.z(:,subj) = dataNorm(:,13);    
    
%   Hip   
    data.right.hip.x(:,subj) = dataNorm(:,17); 
    data.right.hip.y(:,subj) = dataNorm(:,18);
    data.right.hip.z(:,subj) = dataNorm(:,19); 
    
end
data.info.nome = box{1};
data.info.idade = box{2};
data.info.MMII = box{3};
data.info.obs = box{4};

% Selecionar uma articula��o de interesse 
answerjoint = questdlg('Qual articula��o voc� deseja analisar?','Select a joint',...
	'Knee','Hip','None','None');

switch answerjoint
    case 'Knee'
        dado_interesse = data.right.knee; 
    case 'Hip'
        dado_interesse = data.right.hip;
    case 'None'
        disp('Nenhuma articula��o foi selecionada')
end
% Resultado final
disp(dado_interesse)

f1 = msgbox({'Todos os dados foram processados com sucesso!',...
             'Os seus resultados est�o no arquivo "data"'});




        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    



