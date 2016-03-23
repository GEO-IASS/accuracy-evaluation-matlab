%% Accuracy Evaluation Example

targets = [1, 1, 0, 0, 0, 0;
    0, 0, 1, 1, 0, 0;
    0, 0, 0, 0, 1, 1];
outputs = [0.1, 0.86, 0.2, 0.1, .02, 0.1;
    0.4, 0.12, 0.768, 0.145, 0.1, 0.8;
    0.454, 0.35, 0.21, 0.0, 0.89, 0.9999];

eval = evaluation(targets,outputs);

fprintf('%s\n','Confusion Results');
fprintf('\tConfusion value = %0.2f\n', eval.confusion.c);

fprintf('%s\n','Confusion Matrix');
for row = 1:size(eval.confusion.cm,1)
    fprintf('\t');
    for col = 1:size(eval.confusion.cm,2)
        fprintf('%0.2f ', eval.confusion.cm(row,col));
    end
    fprintf('\n');
end

fprintf('%s\n','Indices');
for row = 1:size(eval.confusion.ind,1)
    for col = 1:size(eval.confusion.ind,2)
        s = size(eval.confusion.ind{row,col},2);
        if s == 0
            fprintf('\t[]');
        elseif s == 1
            fprintf('\t[%d]',eval.confusion.ind{row,col}(1));
        else
            fprintf('\t[');
            for ind = 1 : s-1
                fprintf('%d,', eval.confusion.ind{row,col}(ind));
            end
            fprintf('%d] ',eval.confusion.ind{row,col}(s));
        end
    end
    fprintf('\n');
end

fprintf('%s\n','Percentages');
for row = 1:size(eval.confusion.per,1)
    fprintf('\t');
    for col = 1:size(eval.confusion.per,2)
        fprintf('%0.2f ', eval.confusion.per(row,col));
    end
    fprintf('\n');
end

fprintf('%s\n','Accuracy Evaluation Results');
fprintf('\tAverage System Accuracy(%%)   : %0.2f\n', eval.avgAccuracy)
fprintf('\tSystem Error(%%)              : %0.2f\n', eval.errRate)
fprintf('\tPrecision (Micro)(%%)         : %0.2f\n', eval.precisionMicro)
fprintf('\tRecall (Micro)(%%)            : %0.2f\n', eval.recallMicro)
fprintf('\tFscore (Micro)(%%)            : %0.2f\n', eval.fscoreMicro)
fprintf('\tPrecision (Macro)(%%)         : %0.2f\n', eval.precisionMacro)
fprintf('\tRecall (Macro)(%%)            : %0.2f\n', eval.recallMacro)
fprintf('\tFscore (Macro)(%%)            : %0.2f\n', eval.fscoreMacro)
