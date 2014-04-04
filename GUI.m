function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 03-Apr-2014 01:02:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)
       
    % read stuff from conf file
    fileID = fopen('conf2.txt');
    C = textscan(fileID,'%s %d');
    fclose(fileID);
    
    initVars(handles);
    
    s = size(C{1});
    s = s(1);
    
    for i=1:s
        if strcmp(C{1}{i},'points_count')
            handles.points_count = C{2}(i);
        elseif strcmp(C{1}{i},'warp_index')
            handles.warp_index = C{2}(i);
        elseif strcmp(C{1}{i},'hieght')
            handles.hieght = double(C{2}(i));
        elseif strcmp(C{1}{i},'width')
            handles.width  = double(C{2}(i));
        elseif strcmp(C{1}{i},'prcnt')
            handles.prcnt = C{2}(i);
        elseif strcmp(C{1}{i},'realBtn')
            handles.realBtn = C{2}(i);
        elseif strcmp(C{1}{i},'picCount')
            handles.picCount = C{2}(i);
        elseif strcmp(C{1}{i},'useFullRandom')
            handles.useFullRandom = C{2}(i);
        elseif strcmp(C{1}{i},'picPerFeature')
            handles.block_size = C{2}(i);
        end
    end
    
    setButtonVisible(handles, 'off');
    

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_Gennrate.
function btn_Gennrate_Callback(hObject, eventdata, handles)

    hieght = handles.hieght;
    width = handles.width;
    points_count = handles.points_count;
    warp_index = handles.warp_index;
    
    % gerate the DB & mask
    [handles.DB1, pDB] = FcreateDb(10, hieght, width, points_count, warp_index);
    handles.MASK = FcreateMask(hieght, width, pDB, warp_index, points_count, 0.1);
    handles.last_percent = -1;
    
    setButtonVisible(handles, 'on');
    set(handles.btn_Gennrate,'Enable','off');
    
    set(handles.rb_same,'Value',0);
    set(handles.rb_not_same,'Value',0);
    
    handles.outDataIndx = 1;
    handles.sameCounter = 0;
   
    guidata(hObject, handles);
    
    btn_Next_Callback(hObject, eventdata, handles);
    handles = guidata(hObject);
    

% --- Executes on button press in btn_Next.
function btn_Next_Callback(hObject, eventdata, handles)

    prepare_data(hObject, handles);
    handles = guidata(hObject);
    
    set(handles.Same_Counter,'String',['Same Counter: ' int2str(handles.sameCounter) ' / '  int2str(handles.outDataIndx-1)]);
    
    c = handles.block_size;
	size = handles.picCount;
    
    if handles.useFullRandom == 1
        base1 = randsample( 1:size,c );
        base2 = randsample( 1:size,c );
        eyes1 = randsample( 1:size,c );
        eyes2 = randsample( 1:size,c );
        nose1 = randsample( 1:size,c );
        nose2 = randsample( 1:size,c );
        mouth1 = randsample( 1:size,c );
        mouth2 = randsample( 1:size,c );
    else
        u_num = floor( (double(handles.prcnt) / double(100)) * double(handles.block_size) );

        p = randperm(size);
        base1 = sort( p( 1:c ) );
        base2 = sort( p( (c+1-u_num):(c+c-u_num) ) );
        p = randperm(size);
        eyes1 = sort( p( 1:c ) );
        eyes2 = sort( p( (c+1-u_num):(c+c-u_num) ) );
        p = randperm(size);
        nose1 = sort( p( 1:c ) );
        nose2 = sort( p( (c+1-u_num):(c+c-u_num) ) );
        p = randperm(size);
        mouth1 = sort( p( 1:c ) );
        mouth2 = sort( p( (c+1-u_num):(c+c-u_num) ) );        
    end

%     remember for the next 'Next' btn push
    handles.last_percent = pUnion([base1;base2],[eyes1;eyes2],[nose1;nose2],[mouth1;mouth2]);
    
    out1 = FgenImage(handles.DB1, handles.MASK, 3, 1, base1, eyes1, nose1, mouth1);
    imshow(out1, [0,255], 'parent', handles.axes1);
    out2 = FgenImage(handles.DB1, handles.MASK, 3, 1, base2, eyes2, nose2, mouth2);
    imshow(out2, [0,255], 'parent', handles.axes2);
    
    handles.base1 = base1;
    handles.base2 = base2;
    handles.eyes1 = eyes1;
    handles.eyes2 = eyes2;
    handles.nose1 = nose1;
    handles.nose2 = nose2;
    handles.mouth1 = mouth1;
    handles.mouth2 = mouth2;
    
    set(handles.Not_Real_Right,'Value',0);
    set(handles.Not_Real_Left,'Value',0);
    set(handles.rb_same,'Value',0);
    set(handles.rb_not_same,'Value',0);
    set(handles.btn_Next,'Enable','off');
    
    guidata(hObject, handles);
    handles = guidata(hObject);    

function prepare_data(hObject, handles)
    
    if  handles.last_percent == -1
        return;
    end
    
    handles.outData{handles.outDataIndx, 1} = {handles.last_percent};

    if get(handles.rb_same,'Value') == 1
        handles.outData{handles.outDataIndx, 2} = {1};
        handles.sameCounter = handles.sameCounter + 1;
    elseif get(handles.rb_not_same,'Value') == 1
        handles.outData{handles.outDataIndx, 2} = {0};
    end
    
    handles.outData{handles.outDataIndx, 4} = {handles.base1 ; handles.eyes1 ; handles.nose1 ; handles.mouth1};
    handles.outData{handles.outDataIndx, 5} = {handles.base2 ; handles.eyes2 ; handles.nose2 ; handles.mouth2};
    
    if get(handles.Not_Real_Right,'Value') == 1 && get(handles.Not_Real_Left,'Value') == 1
        handles.outData{handles.outDataIndx, 3} = {2};
    elseif get(handles.Not_Real_Right,'Value') == 1
        handles.outData{handles.outDataIndx, 3} = {1};
    elseif get(handles.Not_Real_Left,'Value') == 1
        handles.outData{handles.outDataIndx, 3} = {-1};
    else
        handles.outData{handles.outDataIndx, 3} = {0};
    end
    
    handles.outDataIndx = handles.outDataIndx + 1;
    guidata(hObject, handles);
    handles = guidata(hObject);
    
function [percent] = pUnion(base, eye, nose, mouth)
    
    s1p1 = size( intersect(base(1,:), base(2,:)) );
    s2p1 = size( base(1,:) );
    p1 = s1p1(2) / s2p1(2);
    
    s1p2 = size( intersect(eye(1,:), eye(2,:)) );
    s2p2 = size( eye(1,:) );
    p2 = s1p2(2) / s2p2(2);
    
    s1p3 = size( intersect(nose(1,:), nose(2,:)) );
    s2p3 = size( nose(1,:) );
    p3 = s1p3(2) / s2p3(2);
    
    s1p4 = size( intersect(mouth(1,:), mouth(2,:)) );
    s2p4 = size( mouth(1,:) );
    p4 = s1p4(2) / s2p4(2);
    
    percent = (p1 + p2 + p3 + p4) / 4;

    
function setButtonVisible(handles, onoff)

    set(handles.btn_Next,'Enable',onoff);
    set(handles.rb_same,'Enable',onoff);
    set(handles.rb_not_same,'Enable',onoff);
    set(handles.Btn_Display_Results,'Enable',onoff);
    
    if handles.realBtn == 1
        set(handles.Not_Real_Left,'Enable','off');
        set(handles.Not_Real_Right,'Enable','off');
    else
        set(handles.Not_Real_Left,'Enable',onoff);
        set(handles.Not_Real_Right,'Enable',onoff);
    end

function initVars(handles)
    
    handles.points_count = 39;
    handles.warp_index = 1;
    handles.hieght = double(192);
    handles.width  = double(168);
    handles.prcnt = 50;
    handles.realBtn = 0;
    handles.picCount = 10;
    handles.useFullRandom = 3;
    handles.block_size = 0;


% --- Executes on button press in rb_same.
function rb_same_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of rb_same
    set(handles.rb_not_same,'Value',0);
    set(handles.btn_Next,'Enable','on');

% --- Executes on button press in rb_not_same.
function rb_not_same_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of rb_not_same
    set(handles.rb_same,'Value',0);
    set(handles.btn_Next,'Enable','on');
    
% --- Executes on button press in Not_Real_Left.
function Not_Real_Left_Callback(hObject, eventdata, handles)
% hObject    handle to Not_Real_Left (see GCBO)
    set(handles.btn_Next,'Enable','on');


% --- Executes on button press in Not_Real_Right.
function Not_Real_Right_Callback(hObject, eventdata, handles)
% hObject    handle to Not_Real_Right (see GCBO)
    set(handles.btn_Next,'Enable','on');
    

% --- Executes on button press in Btn_Display_Results.
function Btn_Display_Results_Callback(hObject, eventdata, handles)
% handles    structure with handles and user data (see GUIDATA)
    
% last_percent same not real outDataIndx sameCounter base1
    percentPlot = handles.outData( :, 1 );
    s = size( percentPlot );
    a = reshape( percentPlot, s(2), s(1) );
    a = horzcat([a{:}]);
    figure;
    plot( (1 : (handles.outDataIndx-1)) , cell2mat(a));
    clear s;
    clear a;
    
    samePlot = handles.outData( :, 2 );
    s = size( samePlot );
    a = reshape( samePlot, s(2), s(1) );
    a = horzcat([a{:}]);
    figure;
    plot( (1 : (handles.outDataIndx-1)) , cell2mat(a));
    clear s;
    clear a;
    
    realPlot = handles.outData( :, 3 );
    s = size( realPlot );
    a = reshape( realPlot, s(2), s(1) );
    a = horzcat([a{:}]);
    figure;
    plot( (1 : (handles.outDataIndx-1)) , cell2mat(a));
    clear s;
    clear a;
    
    
    
    


%     handles.outData( :, 2 )
%     handles.outData( :, 3 )
%     a = handles.outData( :, 4 )
%     a{1}{1}





