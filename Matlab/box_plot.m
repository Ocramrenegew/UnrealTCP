    %This scripts creates a box plot for average scores of three quality
    %levels collected in listening experiments. When using this scripts a
    %window should open, asking you to select a folder containing all
    %experiment data. Make sure that only complete data is present in this
    %folder.

    %set hexcodes for plot colors
    colorHigh = '#ffa600';
    colorMid = '#bc5090';
    colorLow = '#003f5c';

    
    currentDirectory = uigetdir('Current Working Directory', 'Select Experiment Folder');
    S = dir(fullfile(currentDirectory, '*'));
    N = setdiff({S([S.isdir]).name},{'.','..'});
    highQualityValues = [];
    mediumQualityValues = [];
    lowQualityValues = [];
    attributes = "";
    for i = 1:numel(N)
        T = readtable(currentDirectory + "\" + N(i) + "\" + N(i) + ".csv", 'delimiter', ',');
        C = readcell(currentDirectory+"\"+N(i)+"\"+"Attributes.txt", 'delimiter',',');
        
        %getSliderLevel
        %sliderA
        if height(T(find(strcmp(T.LevelState,"1A")),:)) ~= 0
            slider1Level = "high";
        elseif height(T(find(strcmp(T.LevelState,"2A")),:)) ~= 0
            slider1Level = "medium";
        elseif height(T(find(strcmp(T.LevelState,"3A")),:)) ~= 0
            slider1Level = "low";
        end
        %sliderB
        if height(T(find(strcmp(T.LevelState,"1B")),:)) ~= 0
            slider2Level = "high";
        elseif height(T(find(strcmp(T.LevelState,"2B")),:)) ~= 0
            slider2Level = "medium";
        elseif height(T(find(strcmp(T.LevelState,"3B")),:)) ~= 0
            slider2Level = "low";
        end
        %sliderC
        if height(T(find(strcmp(T.LevelState,"1C")),:)) ~= 0
            slider3Level = "high";
        elseif height(T(find(strcmp(T.LevelState,"2C")),:)) ~= 0
            slider3Level = "medium";
        elseif height(T(find(strcmp(T.LevelState,"3C")),:)) ~= 0
            slider3Level = "low";
        end

        %for each attribute
        for j=1:height(C)
            currentAttribute = string(C{j});
            attributes(end+1) = currentAttribute;
            attributeTable = T(find(strcmp(T.Attribute, currentAttribute)),:); %subtable for currentAttribute

            slider1Table = attributeTable(find(attributeTable.SliderNr == 1),:); %subtable for each slider
            try
                slider1Value = slider1Table(end,:).Value;
            catch %Array empty
                slider1Value = 0;
            end
            if strcmp(slider1Level, "high")
                highQualityValues(end+1) = slider1Value;
            elseif strcmp(slider1Level, "medium")
                mediumQualityValues(end+1) = slider1Value;
            elseif strcmp(slider1Level, "low")
                lowQualityValues(end+1) = slider1Value;
            end

            slider2Table = attributeTable(find(attributeTable.SliderNr == 2),:);
            try
                slider2Value = slider2Table(end,:).Value;
            catch
                slider2Value = 0;
            end
            if strcmp(slider2Level, "high")
                highQualityValues(end+1) = slider2Value;
            elseif strcmp(slider2Level, "medium")
                mediumQualityValues(end+1) = slider2Value;
            elseif strcmp(slider2Level, "low")
                lowQualityValues(end+1) = slider2Value;
            end

            slider3Table = attributeTable(find(attributeTable.SliderNr == 3),:);
            try
                slider3Value = slider3Table(end,:).Value;
            catch
                slider3Value = 0;
            end
            if strcmp(slider3Level, "high")
                highQualityValues(end+1) = slider3Value;
            elseif strcmp(slider3Level, "medium")
                mediumQualityValues(end+1) = slider3Value;
            elseif strcmp(slider3Level, "low")
                lowQualityValues(end+1) = slider3Value;
            end
        end
    end

    attributes = attributes(2:end);
    valueTable = table(transpose(attributes), transpose(highQualityValues), transpose(mediumQualityValues), transpose(lowQualityValues));
    valueTable.Properties.VariableNames = {'Attribute', 'HighValue', 'MediumValue', 'LowValue'};

    visualTable = table('Size', [0 4], 'VariableTypes', {'string', 'double', 'double', 'double'}, 'VariableNames', {'Attribute', 'HighValue', 'MediumValue', 'LowValue'});
    auditoryTable = table('Size', [0 4], 'VariableTypes', {'string', 'double', 'double', 'double'}, 'VariableNames', {'Attribute', 'HighValue', 'MediumValue', 'LowValue'});

    rows = height(valueTable);
    Vcount = 0;
    Acount = 0;
    lastVAttr = "";
    lastAAttr = "";
    for row=1:rows
        attr = char(valueTable(row,:).Attribute);
        newAttr = string(attr(1:end-4));
        if attr(end) == 'V'
            visualTable(end+1,:) = valueTable(row,:);
            visualTable(end,:).Attribute = newAttr;
        elseif attr(end) == 'A'
            auditoryTable(end+1,:) = valueTable(row,:);
            auditoryTable(end,:).Attribute = newAttr;
        end
    end
    visualTable = sortrows(visualTable, "Attribute");
    auditoryTable = sortrows(auditoryTable, "Attribute");

    %find duplicates
    Vcount = 0;
    Acount = 0;
    lastVAttr = "";
    lastAAttr = "";
    currentAttr = "";
    vTickLabels = strings(0);
    aTickLabels = strings(0);
    for row=1:height(visualTable) %visual
        currentAttr = visualTable(row,:).Attribute;
        if strcmp(currentAttr, lastVAttr)
            Vcount = Vcount + 1;
            visualTable(row,:).Attribute = currentAttr + " " + Vcount;
        else
            Vcount = 0;
        end
        vTickLabels(end+1) = currentAttr;
        lastVAttr = currentAttr;
    end

    for row=1:height(auditoryTable) %auditory
        currentAttr = auditoryTable(row,:).Attribute;
        if strcmp(currentAttr, lastAAttr)
            Acount = Acount +1;
            auditoryTable(row,:).Attribute = currentAttr + " " + Acount;
        else
            Acount = 0;
        end
        aTickLabels(end+1) = currentAttr;
        lastAAttr = currentAttr;
    end
    
    for row=1:height(visualTable) %visual
        visualTable{row,2:4} = visualTable{row,2:4}*10;
    end
    
    for row=1:height(auditoryTable)
        auditoryTable{row,2:4} = auditoryTable{row,2:4}*10;
    end
    
    szV = [3*height(visualTable) 2];
    szA = [3*height(auditoryTable) 2];
    varTypes = ["double","string"];
    varNames = ["Value","Attribute"];
    tablV = table('Size', szV, 'VariableTypes', varTypes, 'VariableNames', varNames);
    tablA = table('Size', szA, 'VariableTypes', varTypes, 'VariableNames', varNames);
    tablV{1:height(visualTable), 1} = visualTable.HighValue;
    tablV{1:height(visualTable), 2} = "High Quality";
    tablV{height(visualTable)+1:2*height(visualTable), 1} = visualTable.MediumValue;
    tablV{height(visualTable)+1:2*height(visualTable), 2} = "Medium Quality";
    tablV{2*height(visualTable)+1:3*height(visualTable), 1} = visualTable.LowValue;
    tablV{2*height(visualTable)+1:3*height(visualTable), 2} = "Low Quality";
    tablA{1:height(auditoryTable), 1} = auditoryTable.HighValue;
    tablA{1:height(auditoryTable), 2} = "High Quality";
    tablA{height(auditoryTable)+1:2*height(auditoryTable), 1} = auditoryTable.MediumValue;
    tablA{height(auditoryTable)+1:2*height(auditoryTable), 2} = "Medium Quality";
    tablA{2*height(auditoryTable)+1:3*height(auditoryTable), 1} = auditoryTable.LowValue;
    tablA{2*height(auditoryTable)+1:3*height(auditoryTable), 2} = "Low Quality";






    %plot
    t = tiledlayout(1,2,'TileSpacing','compact');

    ax1 = nexttile;
    hV = boxchart(tablV.Value, 'GroupByColor', tablV.Attribute, 'LineWidth', 2, 'BoxFaceAlpha', 0.65, 'MarkerStyle', '.', 'MarkerSize', 15);
    hV(1).BoxFaceColor = colorHigh;
    hV(1).MarkerColor = colorHigh;
    hV(2).BoxFaceColor = colorMid;
    hV(2).MarkerColor = colorMid;
    hV(3).BoxFaceColor = colorLow;
    hV(3).MarkerColor = colorLow;
    ylabel('Score', 'FontSize', 12);
    xticklabels({''});
    title('Visual', 'FontSize', 15);
    legend('High Quality', 'Low Quality', 'Medium Quality', 'FontSize', 12, 'Location', 'northeastoutside');
    grid on

    ax2 = nexttile; 
    hA = boxchart(tablA.Value, 'GroupByColor', tablA.Attribute, 'LineWidth', 2, 'BoxFaceAlpha', 0.65, 'MarkerStyle', '.', 'MarkerSize', 15);
    hA(1).BoxFaceColor = colorHigh;
    hA(1).MarkerColor = colorHigh;
    hA(2).BoxFaceColor = colorMid;
    hA(2).MarkerColor = colorMid;
    hA(3).BoxFaceColor = colorLow;
    hA(3).MarkerColor = colorLow;
    ylabel('Score', 'FontSize', 12);
    xticklabels({''})
    title('Auditory', 'FontSize', 15);
    legend('High Quality', 'Low Quality', 'Medium Quality', 'FontSize', 12, 'Location', 'northeastoutside');
    grid on