%  Encontro 4 
%  Script 1 - Carregando arquivos .csv - Parte 1
close all; clear all; clc 

%% C�digo do matlab (Warning)
data_matrix = xlsread('database_imc.xlsx'); 


%% C�digo 2 do matlab (sugest�o) 
data_table = readtable('database_imc.xlsx'); 


%% C�digo 3 fun��o: 
data_funcao = importfile_imctable('database_imc.xlsx');


%% C�digo 4 import data
data_import = importdata('database_imc.xlsx');






















