    %This script plots user scores for individual attributes collected in listening experiments. 
    %When using this script a
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
    
    %plot
    t = tiledlayout(1,2,'TileSpacing','compact');

    ax1 = nexttile;
    plot(categorical(visualTable.Attribute), visualTable.HighValue, 'LineStyle', '--', 'LineWidth', 2, 'Marker', '.', 'MarkerSize', 35, 'Color', colorHigh);
    hold on
    plot(categorical(visualTable.Attribute), visualTable.MediumValue, 'LineStyle', '--', 'LineWidth', 2, 'Marker', '.', 'MarkerSize', 35, 'Color', colorMid);
    hold on
    plot(categorical(visualTable.Attribute), visualTable.LowValue, 'LineStyle', '--', 'LineWidth', 2, 'Marker', '.', 'MarkerSize', 35, 'Color', colorLow);
    xticklabels(vTickLabels);
    xlabel('Attribute', 'FontSize', 12);
    ylabel('Score', 'FontSize', 12);
    grid on
    title('Visual', 'FontSize', 15);
    legend('High Quality', 'Medium Quality', 'Low Quality', 'FontSize', 12, 'Location', 'northeastoutside');

    ax2 = nexttile; 
    plot(categorical(auditoryTable.Attribute), auditoryTable.HighValue, 'LineStyle', '--', 'LineWidth', 2, 'Marker', '.', 'MarkerSize', 35, 'Color', colorHigh);
    hold on
    plot(categorical(auditoryTable.Attribute), auditoryTable.MediumValue, 'LineStyle', '--', 'LineWidth', 2, 'Marker', '.', 'MarkerSize', 35, 'Color', colorMid);
    hold on
    plot(categorical(auditoryTable.Attribute), auditoryTable.LowValue, 'LineStyle', '--', 'LineWidth', 2, 'Marker', '.', 'MarkerSize', 35, 'Color', colorLow);
    xticklabels(aTickLabels);
    xlabel('Attribute', 'FontSize', 12);
    ylabel('Score', 'FontSize', 12);
    grid on
    title('Auditory', 'FontSize', 15);
    legend('High Quality', 'Medium Quality', 'Low Quality', 'FontSize', 12, 'Location', 'northeastoutside');