# Accuracy evaluation
A MATLAB implementation for calculating accuracy metrics (Accuracy, Error Rate, Precision(micro/macro), Recall(micro/macro), Fscore(micro/macro)) for
 classification tasks based on paper [A systematic analysis of performance measures for classification tasks]
 (http://www.sciencedirect.com/science/article/pii/S0306457309000259) and MATLAB confusion implementation.


# Uses

```matlab

	targets =
	    [1, 1, 0, 0, 0, 0;
	    0, 0, 1, 1, 0, 0;
	    0, 0, 0, 0, 1, 1];
	outputs =
	    [0.1, 0.86, 0.2, 0.1, .02, 0.1;
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
```

#Output

Confusion Results

    Confusion value = 0.17
    Confusion Matrix
        1.00 0.00 1.00 
        0.00 2.00 0.00 
        0.00 0.00 2.00 
    Indices
        [2]	[]	[1]
        []	[3,4] 	[]
        []	[]	[5,6] 
    Percentages
        0.20 0.00 1.00 0.80 
        0.00 0.00 1.00 1.00 
        0.00 0.33 0.67 1.00 
Accuracy Evaluation Results

        Average System Accuracy(%)   : 91.11
        System Error(%)              : 8.89
        Precision (Micro)(%)         : 88.89
        Recall (Micro)(%)            : 93.02
        Fscore (Micro)(%)            : 90.91
        Precision (Macro)(%)         : 88.89
        Recall (Macro)(%)            : 94.44
        Fscore (Macro)(%)            : 91.58
# Note

For Java Implementation, visit [accuracy-evaluation-java](https://github.com/ashokpant/accuracy-evaluation-java.git).
For CPP Implementation, visit [accuracy-evaluation-cpp](https://github.com/ashokpant/accuracy-evaluation-cpp.git).

