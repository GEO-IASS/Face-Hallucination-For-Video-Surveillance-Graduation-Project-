close('all')
Width=45;
Height=45;
Factor=4;
[ DSet,N ,] = Step1_InputAndDataSetPreperation('Stair.mpg',Width,Height,Factor);
CurrentIndex=1;
inc=length(N);
for i=1 : 1
DataSet = [];
Num=0;
% for x=CurrentIndex+1:N(i)
%    DataSet=[DataSet;DSet(x,:)]; 
% end;
DataSet=DSet(CurrentIndex : (CurrentIndex+N(i))-1,:);
CurrentIndex = CurrentIndex + N(i);
%%%%% Step 2
GlobalFace = Step2_GlobalFaceShapeReconstruction(DataSet,Width,Height,Factor);
%%%%% Step 3
HallucinatedFaceImage = Step3_addinghighfrequency(GlobalFace, DataSet, 20);

result = mat2gray(double(HallucinatedFaceImage)) + double(GlobalFace);
figure,imshow(bfilter2(mat2gray(result),3,[0,1]),[]);
end;