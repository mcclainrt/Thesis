%% The final product
% Contains code that is "verified"
% requires that "Load_all" be ran prior

clear all
clc
close all

% load('Data/Ex1struct')
% load('Data/Ex2struct')
% load('Data/Ex2structtab') % will remove when I transfer bag files
load('Data/Ex3struct')
Ex3 = structout;
load('Data/Ex4struct')
Ex4 = structout; % should find a way to fix this
% load('Data/Ex5struct')
% load('Data/Ex6struct')
% load('Data/Ex7struct')

% Ex2.T = Ex2Tab.T;% will remove when I transfer bag files
% clearvars Ex2Tab% will remove when I transfer bag files

% Ex2.Results.P = structparse(Ex2.P,5);
% Ex2.Results.V1 = structparse(Ex2.V1,5);
% Ex2.Results.T = structparse(Ex2.T,5);

 Ex3.Results.V2 = structparse(Ex3.V2,5);
 Ex3.Results.V1 = structparse(Ex3.V1,5);
 Ex3.Results.T = structparse(Ex3.T,5);


plotresults(Ex3)
