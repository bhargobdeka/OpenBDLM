%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                                                                         %
%                    OpenBDLM configuration file                          %
%          Autogenerated by OpenBDLM on 06-Aug-2018 16:36:41              %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A - Project name
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
misc.ProjectName='CTL_001';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B - Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat=load('DATA_CTL_001.mat'); 
data.values=dat.values;
data.timestamps=dat.timestamps;
misc.trainingPeriod=[1,1461];
data.labels={'TS01'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C - Model structure 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Components reference numbers
% 11: Local level
% 12: Local trend
% 13: Local acceleration
% 21: Local level compatible with local trend
% 22: Local level compatible with local acceleration
% 23: Local trend compatible with local acceleration
% 31: Periodic
% 41: Autoregressive
% 51: Dynamic regression with hidden component
% 52: Static kernel regression
% 53: Dynamic kernel regression
% 61: Level Intervention

% Model components
% Model 1
model.components.block{1}={[11 31 41 ] };

% Model component constrains | Take the same  parameter as model class #1
 
% Model inter-components dependence | {[components form dataset_i depends on components from  dataset_j]_i,[...]}
model.components.ic={[ ] };

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D - Model parameters 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
model.param_properties={
    % #1             #2         #3       #4      #5                  #6          #7      #8      #9              #10
    % Param name     Block name Model    Obs     Bound               Prior       Mean    Std     Values          Ref
	'\sigma_w'  ,	 'LL',		'1',	 '1',	 [ NaN  , NaN  ],	 'normal',	 0 ,	 1E+06,	 0       ,  	 1  %#1
	'p'         ,	 'PD1',		'1',	 '1',	 [ NaN  , NaN  ],	 'normal',	 0 ,	 1E+06,	 365.24  ,  	 2  %#2
	'\sigma_w'  ,	 'PD1',		'1',	 '1',	 [ NaN  , NaN  ],	 'normal',	 0 ,	 1E+06,	 0       ,  	 3  %#3
	'\phi'      ,	 'AR',		'1',	 '1',	 [ 0    , 1    ],	 'normal',	 0 ,	 1E+06,	 0.75    ,  	 4  %#4
	'\sigma_w'  ,	 'AR',		'1',	 '1',	 [ 0    , Inf  ],	 'normal',	 0 ,	 1E+06,	 0.01    ,  	 5  %#5
	'\sigma_v'  ,	 '',		'1',	 '1',	 [ 0    , Inf  ],	 'normal',	 0 ,	 1E+06,	 0.01    ,  	 6  %#6
};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% E - Initial states values 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial hidden states mean for model 1:
model.initX{ 1 }=[	10    	10    	10    	0     ]';

% Initial hidden states variance for model 1: 
model.initV{ 1 }=diag([ 	0.01  	0.04  	0.04  	0.01   ]);

% Initial probability for model 1
model.initS{1}=[1     ];

