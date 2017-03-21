if ~isempty(findstr(filename,'AF'))
    C(mi,7) = {'Asian'};
    C(mi,8) = {'Female'};
else if ~isempty(findstr(filename,'AM'))
    C(mi,7) = {'Asian'};
    C(mi,8) = {'Male'};
else if ~isempty(findstr(filename,'BF'))
    C(mi,7) = {'Black'};
    C(mi,8) = {'Female'};
else if ~isempty(findstr(filename,'BM'))
    C(mi,7) = {'Black'};
    C(mi,8) = {'Male'};
else if ~isempty(findstr(filename,'LF'))
    C(mi,7) = {'Latino'};
    C(mi,8) = {'Female'};
else if ~isempty(findstr(filename,'LM'))
    C(mi,7) = {'Latino'};
    C(mi,8) = {'Male'};
else if ~isempty(findstr(filename,'WF'))
    C(mi,7) = {'White'};
    C(mi,8) = {'Female'};
else if ~isempty(findstr(filename,'WM'))
    C(mi,7) = {'White'};
    C(mi,8) = {'Male'};
    else
        C(mi, 7) = {0};
        C(mi, 8) = {0};
    