function [out] = evaluation(targets,outputs)

[c,cm,ind,per] = confusion(targets,outputs);

out.confusion.c = c;
out.confusion.cm = cm;
out.confusion.ind = ind;
out.confusion.per = per;
% Average Accuracy (The average per-class effectiveness of a classifier)
nClasses=size(outputs,1);
avgAccuray=0.0;
for i=1:nClasses
    fn=per(i,1);
    fp=per(i,2);
    tp=per(i,3);
    tn=per(i,4);
    avgAccuray=+avgAccuray+((tp+tn)/(tp+fn+fp+tn));
end
avgAccuray=avgAccuray/nClasses;

% Error Rate (The average per-class classification error)
errRate=0.0;
for i=1:nClasses
    fn=per(i,1);
    fp=per(i,2);
    tp=per(i,3);
    tn=per(i,4);
    errRate=+errRate+((fp+fn)/(tp+fn+fp+tn));
end
errRate=errRate/nClasses;

%Precision-Micro (Agreement of the data class labels with those of a
%classifiers if calculated from sums of per-text decisions)
numerator=0.0;
denominator=0.0;
for i=1:nClasses
    fn=per(i,1);
    fp=per(i,2);
    tp=per(i,3);
    tn=per(i,4);
    numerator=numerator+tp;
    denominator=denominator+ (tp+fp);
end
precisionMicro=numerator/denominator;

%Recall-Micro (Effectiveness of a classifier to identify class labels if
%calculated from sums of per-text decisions)
numerator=0.0;
denominator=0.0;
for i=1:nClasses
    fn=per(i,1);
    fp=per(i,2);
    tp=per(i,3);
    tn=per(i,4);
    numerator=numerator+tp;
    denominator=denominator+ (tp+fn);
end
recallMicro=numerator/denominator;

%Fscore-Micro (Relations between data�s positive labels and those given by a classifier based on sums of per-text decisions)
beta=1;
numerator=(beta^2+1)*precisionMicro*recallMicro;
denominator=beta^2*precisionMicro+recallMicro;
fscoreMicro=numerator/denominator;

%-------------------------------------------------------
%Precision-Macro (An average per-class agreement of the data class labels with those of a classifiers)
precisionMacro=0.0;
for i=1:nClasses
    fn=per(i,1);
    fp=per(i,2);
    tp=per(i,3);
    tn=per(i,4);
    precisionMacro=precisionMacro+(tp/(tp+fp));
end
precisionMacro=precisionMacro/nClasses;

%Recall-Micro (An average per-class effectiveness of a classifier to identify class labels)
recallMacro=0.0;
for i=1:nClasses
    fn=per(i,1);
    fp=per(i,2);
    tp=per(i,3);
    tn=per(i,4);
    recallMacro=recallMacro+(tp/(tp+fn));
end
recallMacro=recallMacro/nClasses;

%Fscore-Macro (Relations between data�s positive labels and those given by a classifier based on a per-class average)
beta=1;
numerator=(beta^2+1)*precisionMacro*recallMacro;
denominator=beta^2*precisionMacro+recallMacro;
fscoreMacro=numerator/denominator;

out.avgAccuracy = avgAccuray*100;
out.errRate = errRate*100;
out.precisionMicro = precisionMicro*100;
out.recallMicro = recallMicro*100;
out.fscoreMicro = fscoreMicro*100;

out.precisionMacro = precisionMacro*100;
out.recallMacro = recallMacro*100;
out.fscoreMacro = fscoreMacro*100;
end