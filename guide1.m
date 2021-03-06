function varargout = guide1(varargin)
% GUIDE1 MATLAB code for guide1.fig
%      GUIDE1, by itself, creates a new GUIDE1 or raises the existing
%      singleton*.
%
%      H = GUIDE1 returns the handle to a new GUIDE1 or the handle to
%      the existing singleton*.
%
%      GUIDE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE1.M with the given input arguments.
%
%      GUIDE1('Property','Value',...) creates a new GUIDE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide1

% Last Modified by GUIDE v2.5 24-Aug-2018 10:19:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide1_OpeningFcn, ...
                   'gui_OutputFcn',  @guide1_OutputFcn, ...
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

function guide1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = guide1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset');
[filename,pathname] = uigetfile({'*.jpg';'*.bmp';'*.png'},'choose a picture');
if filename==0
    warning('shuold be a picture')
else
    im = imread(fullfile(pathname,filename));
    axes(handles.axes1);
    handles.im=im;
    guidata(hObject,handles);
    hImage=imshow(im);
    set(hImage,'ButtonDownFcn',{@myCallback,handles});
end
function myCallback(hObject,eventdata,handles)
global h;
delete(h);
ClickPoint = get(gca,'currentpoint');
col_coordinate= ClickPoint(1,1);
row_coordinate = ClickPoint(1,2);
h=imrect(gca,[col_coordinate,row_coordinate,0,0]);
pos=getPosition(h);
cla(handles.axes2,'reset');
imCp=imcrop(handles.im,pos);
axes(handles.axes2);
imshow(imCp);
set(handles.edit2,'string',imCp(:,:,1));
set(handles.edit3,'string',imCp(:,:,2));
set(handles.edit4,'string',imCp(:,:,3));

function axes1_ButtonDownFcn(hObject, eventdata, handles)

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)
if isfield(handles,'im')
    im=handles.im;
    [rol,col]=size(im(:,:,1));
    R=str2double(get(handles.edit2,'String'));
    G=str2double(get(handles.edit3,'String'));
    B=str2double(get(handles.edit4,'String'));
    det=str2double(get(handles.edit5,'String'));
    newim=zeros(rol,col,3);
    for i=1:1:rol
        for j=1:1:col
            c_r=im(i,j,1);c_g=im(i,j,2);c_b=im(i,j,3);
            if R-det<=c_r && c_r<=R+det && G-det<=c_g && c_g<=G+det && B-det<=c_b && c_b<=B+det
                newim(i,j,1)=1;
                newim(i,j,2)=1;
                newim(i,j,3)=1;
            end
        end 
    end
    axes(handles.axes1);
    imshow(newim);
end

function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string',20);

function pushbutton3_Callback(hObject, eventdata, handles)
if isfield(handles,'im')
    cla(handles.axes1,'reset');
    axes(handles.axes1);
    hImage=imshow(handles.im);
    set(hImage,'ButtonDownFcn',{@myCallback,handles});
end

function axes1_DeleteFcn(hObject, eventdata, handles)

function figure1_DeleteFcn(hObject, eventdata, handles)
