function varargout = gra(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gra_OpeningFcn, ...
                   'gui_OutputFcn',  @gra_OutputFcn, ...
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

function gra_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% UIWAIT makes gra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gra_OutputFcn(~, ~, handles) 
try
    box on
    hold on
    V=zeros(4);
    x1=round(rand*3+1);
    y1=round(rand*3+1);
    x2=round(rand*3+1);
    y2=round(rand*3+1);
    while x2==x1 && y1==y2
        x2=round(rand*3+1);
        y2=round(rand*3+1);
    end
    
    V(x1,y1)=2;
    V(x2,y2)=2;
    score=0;
    paintingBoard(V');

    set(handles.wynik2, 'String',score)

    win=0;
    %Warunek na wygran¹-zdobyæ na jednym polu 2048
    while true
        X=V;
        if isequal(X,move(V,28,score)) && isequal(X,move(V,29,score)) && isequal(X,move(V,30,score)) && isequal(X,move(V,31,score))
            %patch([0,1,1,0],[0,0,1,1],w, 'EdgeColor', grey)
                 text(2,2,'Game over.','Color','r','FontSize',20,...
                            'FontWeight','Bold','HorizontalAlignment','Center');
        end
        waitforbuttonpress(); 
        a=get(gcf,'CurrentCharacter');
        [V,score]=move(V,a,score);
        

        if ~isequal(X,V)
            x1=round(rand*3+1);
            y1=round(rand*3+1);
            while V(x1,y1)
                x1=round(rand*3+1);
                y1=round(rand*3+1);
            end
            V(x1,y1)=2;
            paintingBoard(V');
        end
        if max(max(V))==2024 && win==0
            text(2,3,'You win!','Color','r','FontSize',20,...
            'FontWeight','Bold','HorizontalAlignment','Center');  
            text(2,2,'Press any key to continue game.','Color','r','FontSize',20,...
            'FontWeight','Bold','HorizontalAlignment','Center'); 
            win=1;

            waitforbuttonpress();

            paintingBoard(V');
        end
        set(handles.wynik2, 'String', score) 
    end
    
catch   
end

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, ~)
close()
gra

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, ~)
close()


