function [misc]=chooseProjectName(misc, varargin)
%CHOOSEPROJECTNAME Request user's input to choose a project name
%   SYNOPSIS:
%     [misc]=CHOOSEPROJECTNAME(misc, varargin)
% 
%   INPUT:
%      misc     - structure (required)
%
%      FilePath - character (optional)
%                 saving directory for the project file
%                 default: '.' (current directory)
%   OUTPUT:
%      misc     - structure
%
%   DESCRIPTION:
%      CHOOSEPROJECTNAME request user's input to choose a project name
%      CHOOSEPROJECTNAME verifies that the provided project name does not 
%      already exist from previously saved projects located in the
%      "FilePath" location given in argument. 
%
%   EXAMPLES:
%      [misc]=CHOOSEPROJECTNAME(misc)
%      [misc]=CHOOSEPROJECTNAME(misc, 'FilePath', 'saved_projects')
%
%   See also 
 
%   AUTHORS: 
%      Ianis Gaudot, Luong Ha Nguyen, James-A Goulet
% 
%      Email: <james.goulet@polymtl.ca>
%      Website: <http://www.polymtl.ca/expertises/goulet-james-alexandre>
% 
%   MATLAB VERSION:
%      Tested on 9.1.0.441655 (R2016b)
% 
%   DATE CREATED:
%       April 27, 2018
% 
%   DATE LAST UPDATE:
%       August 9, 2018
 
%--------------------BEGIN CODE ---------------------- 
%% Get arguments passed to the function and proceed to some verifications
p = inputParser;

validationFct_FilePath = @(x) ischar(x) && ...
    ~isempty(x(~isspace(x)));

defaultFilePath = '.';

addRequired(p,'misc', @isstruct );
addParameter(p,'FilePath', defaultFilePath, validationFct_FilePath );

parse(p,misc, varargin{:});
misc=p.Results.misc;  
FilePath=p.Results.FilePath;

% Set fileID for logfile
if misc.internalVars.isQuiet
    % output message in logfile
    fileID=fopen(misc.internalVars.logFileName, 'a');
else
    % output message on screen and logfile using diary command
    fileID=1;
end

%% Create specified path if not existing
[isFileExist] = testFileExistence(FilePath, 'dir');
if ~isFileExist
    % create directory
    mkdir(FilePath)   
    % set directory on path
    addpath(FilePath)
end 

ProjectsInfoFilename = 'ProjectsInfo.mat';

% Load file display info 
FileContent = load(fullfile(pwd, FilePath, ProjectsInfoFilename));    
ProjectInfo = FileContent.ProjectInfo;

%% Get project name from user's input
incTest=0;
MaxFailAttempts = 4;

isNameCorrect = false;
while ~isNameCorrect
    incTest=incTest+1;
    if incTest > MaxFailAttempts ; error(['Too many failed ', ...
            'attempts (', num2str(MaxFailAttempts)  ').']) ; end
    fprintf(fileID,'\n');
    fprintf(fileID,'- Enter a project name (max 25 characters):\n');
    % read from user input file (use of global variable )?
    if misc.internalVars.BatchMode.isBatchMode
        project_name=eval(char(misc.internalVars.BatchMode.Answers{misc.internalVars.BatchMode.AnswerIndex}));
        fprintf(fileID,'     %s',project_name);
    else
        project_name=input('     choice >> ','s');
    end
    
    if ischar(project_name)
        % Remove space and quotes
        project_name=strrep(project_name,'''','' ); % remove single quotes
        project_name=strrep(project_name,'"','' ); % remove double quotes
        project_name=strrep(project_name, ' ','' ); % remove spaces
    end
    
    if isempty(project_name)
        continue
    elseif length(project_name)>25
        fprintf(fileID,'     wrong input -> string > 25 characters\n');
    else
        
        if ~isempty(ProjectInfo)
        
         Test_Name = strcmpi(ProjectInfo(:,1), project_name);
               
        if any(Test_Name)
            fprintf(fileID, ['     Project name %s already exists.' ...
                ' Provide another name. \n'], project_name);
            isNameCorrect = false;
        else
            isNameCorrect = true;
        end
        else            
            isNameCorrect = true;
        end
    end
end

%% Store project name
misc.ProjectName = project_name;

% Increment global variable to read next answer when required
misc.internalVars.BatchMode.AnswerIndex = misc.internalVars.BatchMode.AnswerIndex+1;
fprintf(fileID,'\n');
%--------------------END CODE ------------------------ 
end
