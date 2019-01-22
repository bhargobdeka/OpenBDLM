%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    OpenBDLM configuration file                          %
%          Autogenerated by OpenBDLM on 09-Jan-2019 12:06:54              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A - Project name
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
misc.ProjectName='CTL_002';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B - Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat=load('DATA_CTL_002.mat'); 
data.values=dat.values;
data.timestamps=dat.timestamps;
data.labels={'DISP','TEMP'};

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
% 51: Kernel regression
% 61: Level Intervention

% Model components
% Model 1
model.components.block{1}={[11 41 ] [11 31 31 41 ] };

% Model component constrains | Take the same  parameter as model class #1
 
% Model inter-components dependence | {[components form dataset_i depends on components from  dataset_j]_i,[...]}
model.components.ic={[2 ] [ ] };


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D - Model parameters 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
model.param_properties={
     % #1           #2             #3      #4    #5               #6           #7       #8              #9              #10
     % Param name   Block name     Model   Obs   Bound            Prior        Mean     Std             Values          Ref
     '\sigma_w',   'LL',           '1',   '1',   [NaN  NaN  ],    'N/A',       NaN,     NaN,            0.000,          1      %#1   
     '\phi',       'AR',           '1',   '1',   [0  1      ],    'N/A',       NaN,     NaN,            0.97633,        2      %#2   
     '\sigma_w',   'AR',           '1',   '1',   [0  Inf    ],    'N/A',       NaN,     NaN,            0.019283,       3      %#3   
     '\sigma_v',   '',             '1',   '1',   [0  Inf    ],    'N/A',       NaN,     NaN,            7.4258e-07,     4      %#4   
     '\sigma_w',   'LL',           '1',   '2',   [NaN  NaN  ],    'N/A',       NaN,     NaN,            0.0001,         5      %#5   
     'p',          'PD1',          '1',   '2',   [NaN  NaN  ],    'N/A',       NaN,     NaN,            365.2422,       6      %#6   
     '\sigma_w',   'PD1',          '1',   '2',   [NaN  NaN  ],    'N/A',       NaN,     NaN,            0,              7      %#7   
     'p',          'PD2',          '1',   '2',   [NaN  NaN  ],    'N/A',       NaN,     NaN,            1,              8      %#8   
     '\sigma_w',   'PD2',          '1',   '2',   [NaN  NaN  ],    'N/A',       NaN,     NaN,            0,              9      %#9   
     '\phi',       'AR',           '1',   '2',   [0  1      ],    'N/A',       NaN,     NaN,            0.99421,        10     %#10  
     '\sigma_w',   'AR',           '1',   '2',   [0  Inf    ],    'N/A',       NaN,     NaN,            0.43095,        11     %#11  
     '\sigma_v',   '',             '1',   '2',   [0  Inf    ],    'N/A',       NaN,     NaN,            2.6763e-05,     12     %#12  
     '\phi',       '1|2(PD)',      '1',   '2',   [-Inf  Inf ],    'N/A',       NaN,     NaN,            -0.011555,      13     %#13  
     '\phi',       '1|2(PD)',      '1',   '2',   [-Inf  Inf ],    'N/A',       NaN,     NaN,            0.071169,       14     %#14  
     '\phi',       '1|2(AR)',      '1',   '2',   [-Inf  Inf ],    'N/A',       NaN,     NaN,            0.00029228,     15     %#15  
};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% E - Initial states values 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial hidden states mean for model 1:
model.initX{ 1 }=[	25.9  	-0.0595	5.45  	17.6  	-0.934	0.678 	0.41  	2.1   ]';

% Initial hidden states variance for model 1: 
model.initV{ 1 }=diag([ 	3.71E-05	0.000457	0.287 	0.263 	0.265 	8.14E-05	8.14E-05	0.71   ]);

% Initial probability for model 1
model.initS{1}=[1     ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% F - Options 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
misc.options.NaNThreshold=100;
misc.options.Tolerance=1e-06;
misc.options.trainingPeriod=[1  Inf];
misc.options.isParallel=false;
misc.options.maxIterations=100;
misc.options.maxTime=60;
misc.options.isMAP=false;
misc.options.isPredCap=false;
misc.options.isLaplaceApprox=false;
misc.options.isMute=false;
misc.options.NRLevelsLambdaRef=4;
misc.options.NRTerminationTolerance=1e-07;
misc.options.MethodStateEstimation='UD';
misc.options.MaxSizeEstimation=100;
misc.options.DataPercent=100;
misc.options.Seed=12345;
misc.options.FigurePosition=[100   100  1300   270];
misc.options.isSecondaryPlot=false;
misc.options.Subsample=1;
misc.options.Linewidth=3;
misc.options.ndivx=4;
misc.options.ndivy=3;
misc.options.Xaxis_lag=0;
misc.options.isExportTEX=false;
misc.options.isExportPNG=false;
misc.options.isExportPDF=false;

