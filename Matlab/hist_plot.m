    %This script collects attributes given during listening experiments and
    %plots them as a histogram. When using this script a window should
    %open, asking you to select a folder containing all experiment data.
    %Make sure that only complete data is present in this folder.

    A = {};
    V = {};
    X = {};
    currentDirectory = uigetdir('Current Working Directory', 'Select Experiment Folder');
    S = dir(fullfile(currentDirectory, '*'));
    N = setdiff({S([S.isdir]).name},{'.','..'});
    for i = 1:numel(N)
        %T = readtable(currentDirectory + "\" + N(i) + "\" + N(i) + ".csv", 'delimiter', ',');
        %X = [X; T.Attribute];
        C = readcell(currentDirectory+"\"+N(i)+"\"+"Attributes.txt");
        X = [X; C];
    end
    [sizeY, sizeX] = size(X);
    for i = 1:sizeY
       
        if strcmp(string(X(i,3)),"A")
            A{end+1} = X(i,1);
        elseif strcmp(string(X(i,3)),"V")
            V{end+1} = X(i,1);
        end
    end
    A = transpose(A);
    V = transpose(V);
    [Ac,An] = groupcounts(string(A));
    [Vc,Vn] = groupcounts(string(V));
    pie(Ac,string(An));
    pie(Vc,string(Vn));
    
    t = tiledlayout(1,2,'TileSpacing','compact');
    
    ax1 = nexttile;
    %pie(Ac,string(An));
    hist(categorical(string(A)));
    title('Auditory', 'FontSize', 15);
    ylim([0,numel(N)]);
    xlabel('Attribute');
    ylabel('# of People');
    grid on;
    
    ax2 = nexttile;
    %pie(Vc,string(Vn));
    hist(categorical(string(V)));
    title('Visual', 'FontSize', 15);
    ylim([0,numel(N)]);
    xlabel('Attribute');
    ylabel('# of People');
    grid on;